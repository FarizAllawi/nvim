return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettier")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx", "javascript", "jsx", "vue" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          -- keys = {
          --   {
          --     "<leader>lo",
          --     function()
          --       vim.lsp.buf.code_action({
          --         apply = true,
          --         context = {
          --           only = { "source.organizeImports.ts" },
          --           diagnostics = {},
          --         },
          --       })
          --     end,
          --     desc = "Organize Imports",
          --   },
          -- },
          settings = {
            root_dir = function(...)
              return require("lspconfig.util").root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(
                ...
              )
            end,
            single_file_support = false,
            diagnostics = { ignoredCodes = { 6133 } },
            completions = {
              completeFunctionCalls = true,
            },
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
        volar = {},
      },
      attach_handlers = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              local clients = require("tvl.util").get_clients({ bufnr = event.buf, name = "eslint" })
              local client

              if clients and #clients > 0 then
                client = clients[1]
              end
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end,
          })
        end,
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["tsx"] = { "prettier" },
        ["jsx"] = { "prettier" },
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
        ["blade"] = { "blade-formatter" }, -- Add blade-formatter for blade files only
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
