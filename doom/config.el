;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Trung (Daniel) An"
      user-mail-address "fifty8co@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 13)
     doom-variable-pitch-font (font-spec :family "Cantarell" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq select-enable-clipboard nil) ;; Disable clipboard when press C-x
(setq-default indent-tabs-mode nil) ;; Spaces instead of tab
(setq-default tab-width 4)
(setq-default tab-always-indent nil)

(setq display-line-numbers-type t)

(setq lsp-idle-delay 0.500)

(setq auto-save-default nil)

(after! lsp-mode
  (add-hook 'java-mode-hook #'lsp-deferred)
  (add-hook 'python-mode-hook #'lsp-deferred)
  (add-hook 'typescript-mode #'lsp-deferred)
  (add-hook 'javascript-mode #'lsp-deferred)
  (add-hook 'web-mode-hook #'lsp-deferred)
)

;; Java
(after! lsp-java
  (setq lsp-java-workspace-dir "~/.config/emacs/.local/java-workspace")
  (setq lsp-java-import-maven-enabled t)
  (setq lsp-java-maven-download-sources t)
  (setq lsp-java-vmargs
        '("-XX:+UseParallelGC"
          "-XX:GCTimeRatio=4"
          "-XX:AdaptiveSizePolicyWeight=90"
          "-Dsun.zip.disableMemoryMapping=true"
          "-Xmx4G"
          "-Xms1G"))
)
;; Intelephense ;;
(after! lsp-mode
  (add-hook 'php-mode-hook #'lsp-deferred)
  (setq lsp-intelephense-storage-path "~/.cache/intelephense")
  (setq lsp-intelephense-licence-key nil)
  (setq lsp-intelephense-stubs
        ["apache" "bcmath" "bz2" "calendar" "com_dotnet" "Core" "ctype" "curl" "date"
         "dba" "dom" "enchant" "exif" "FFI" "fileinfo" "filter" "fpm" "ftp" "gd" "gettext"
         "gmp" "hash" "iconv" "imap" "intl" "json" "ldap" "libxml" "mbstring" "meta" "mysqli"
         "oci8" "odbc" "openssl" "pcntl" "pcre" "PDO" "pdo_ibm" "pdo_mysql" "pdo_pgsql"
         "pdo_sqlite" "pgsql" "Phar" "posix" "pspell" "readline" "Reflection" "session"
         "shmop" "SimpleXML" "snmp" "soap" "sockets" "sodium" "SPL" "sqlite3" "standard"
         "superglobals" "sysvmsg" "sysvsem" "sysvshm" "tidy" "tokenizer" "xml" "xmlreader"
         "xmlrpc" "xmlwriter" "xsl" "Zend OPcache" "zip" "zlib" "wordpress" "wordpress-tests"
         "woocommerce" "woocommerce-subscriptions" "acf-pro" "wp-cli" "gravity-forms" "genesis"])
  
  (lsp-register-custom-settings
   '(("intelephense.files.maxSize" 10000000)
     ("intelephense.telemetry.enabled" nil)
     ("intelephense.format.enable" t))
   )
)

;; Lsp-ui-doc-glance ;;
(map! :map lsp-mode-map
      "C-c k" #'lsp-ui-doc-glance)
(after! lsp-ui-doc
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-max-width 120)
  (setq lsp-ui-doc-max-height 50)
)
