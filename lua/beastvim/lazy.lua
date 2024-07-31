local Icons = require("beastvim.tweaks").icons
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup({
  spec = {
    { import = "beastvim.plugins" },
    { import = "beastvim.features.lsp.lang.markup", enabled = true },
    { import = "beastvim.features.lsp.lang.python", enabled = true },
    { import = "beastvim.features.lsp.lang.markdown", enabled = true },
    { import = "beastvim.features.lsp.lang.typescript", enabled = true },
    { import = "beastvim.features.lsp.lang.flutter", enabled = false },
    { import = "beastvim.features.lsp.lang.vue", enabled = false },
    { import = "beastvim.features.lsp.lang.php", enabled = true },
    { import = "beastvim.features.lsp.lang.go", enabled = false },
    { import = "beastvim.features.lsp.lang.docker", enabled = true },
    { import = "beastvim.features.lsp.lang.dotnet", enabled = false },
    { import = "beastvim.features.lsp.lang.tailwind", enabled = true },
    { import = "beastvim.features.lsp.lang.dot", enabled = true },
  },
  defaults = {
    lazy = true,
    -- version = false, -- always use the latest git commit
    version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "rose-pine", "monokai-pro", "habamax", "catppuccin" } },
  checker = { enabled = false, notify = false },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = false, -- get a notification when changes are found
  },
  ui = {
    icons = {
      ft = Icons.lazy.ft,
      lazy = Icons.lazy.lazy,
      loaded = Icons.lazy.loaded,
      not_loaded = Icons.lazy.not_loaded,
    },
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})

-- -- Ensure prettier is used for jsx and tsx files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "javascriptreact", "typescriptreact" },
--   callback = function()
--     vim.b.formatter = "prettier"
--   end,
-- })

-- Ensure blade-formatter is only applied to blade files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "blade",
--   callback = function()
--     vim.b.formatter = "blade_formatter"
--   end,
-- })
