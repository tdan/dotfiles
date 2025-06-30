vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

local home_dir = os.getenv('HOME')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_folder = home_dir .. '/.local/share/Eclipse/' .. project_name
-- local eclipse_folder = home_dir .. '/Documents/Code/eclipse-workspace/' .. project_name
local jdtls = require('jdtls')
local dap = require('jdtls.dap')
local cmp = require('cmp_nvim_lsp')

-- for completions
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp.default_capabilities(client_capabilities)

-- File types that signify a Java project's root directory. This will be
-- used by eclipse to determine what constitutes a workspace
local root_markers = {'mvnw', '.git', 'gradlew','pom.xml','build.gradle','build.sbt','.project'}
local root_dir = require('jdtls.setup').find_root(root_markers)

local config = {
  capabilities = capabilities,
  cmd = {
    -- 'jdtls',
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    -- '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. home_dir .. '/.local/share/Eclipse/lombok.jar',
    '-jar', vim.fn.glob('~/jdt-language-server/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration', home_dir .. '/jdt-language-server/config_linux',
    '-data', workspace_folder,
  },
  -- root_dir =  vim.fs.dirname(vim.fs.find({'.git', 'gradlew', 'mvnw'}, { upward = true })[1]),
  root_dir = root_dir,

  init_options = {
    bundles = {
      vim.fn.glob(home_dir .. '/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', 1)
    },
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
  on_attach = function (client, bufnr)
    -- With 'hotcodereplace = auto' the debug will try to apply code changes
    -- you make during debugging session instantly
    jdtls.setup_dap({ hotcodereplace = 'auto' })
    dap.setup_dap_main_class_configs()
    -- jdtls.add_commands()
  end,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      project = {
        referencedLibraries = {},
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
      },
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      contentProvider = { 
        preferred = 'fernflower'
      },
      implementationsCodeLens = {
        enabled = true,
      },
      format = {
        enabled = true,
        settings = {
          url = home_dir .. '/.local/share/Eclipse/eclipse-java-google-style.xml',
          profile = 'GoogleStyle',
        }
      }
    },
    signatureHelp = {
      enabled = true,
    },
    completion = {
      favoriteStaticMembers = {
        'org.hamcrest.MatcherAssert.assertThat',
        'org.hamcrest.Matchers.*',
        'org.hamcrest.CoreMatchers.*',
        'org.junit.jupiter.api.Assertions.*',
        'java.util.Objects.requireNonNull',
        'java.util.Objects.requireNonNullElse',
        'org.mockito.Mockito.*',
      },
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarTreshold = 9999,
      }
    },
    codeGeneration = {
      toString = {
        template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
      },
      hashCodeEquals = {
        useJava7Objects = true,
      },
      useBlocks = true,
    }
  },
  filetypes = { 'java' },
}

jdtls.start_or_attach(config)

