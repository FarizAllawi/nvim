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
        vim.list_extend(opts.ensure_installed, { "php", "html", "typescript", "tsx", "javascript", "jsx", "vue" })
      end
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "php",
          "html",
          "javascript",
          "typescript",
          "tsx",
          "vue",
        },
        highlight = {
          enabled = true,
        },
      })
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
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
                associations = { "*.php", "*.phtml", "*.module", "*.inc" },
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
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["php"] = { "prettier" },
        ["blade"] = { "blade-formatter" },
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },
      formatters = {
        prettier = {
          command = "prettier",
          args = {
            "--print-width",
            "150",
            "--stdin-filepath",
            "$FILENAME",
          },
        },
      },
    },
  },
}
