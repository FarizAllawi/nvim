return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "intelephense", "blade-formatter" })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "html"})
      end
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "php", "html"},
        highlight = {
          enabled = true,
        },
      })
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.cmd([[
            augroup LspFormatting
              autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 2000 })
                augroup END
          ]])
        end
      end,
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000, -- Increase max file size for large projects
              },
            },
          },
        },
      },
    },
  },
  -- Laravel specific features
  { "noahfrederick/vim-laravel" },
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },
  -- Conform.nvim for formatting
{
    require('conform').setup {
        formatters_by_ft = {
          ["php"] = { "prettier" },
          ["blade"] = { "blade-formatter" },
        },
      },
  },
  vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
}
