-- Various utility functions to use within Nvim and user configurations.
--
-- Heavily influenced by AstroNvim.utils module
-- This module can be loaded with `local utils = require "utils"`
--
-- @module utils
-- @license GNU General Public License v3.0
--
local UF = {}

function is_plugin_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, 'lazy.core.config')
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

return UF
