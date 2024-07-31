return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },

  {
    "catppuccin/nvim",
    lazy = true,
    -- priority = 1000,
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    -- vim.cmd.colorscheme("catppuccin"),
  },

  {
    "rose-pine/neovim",
    lazy = true,
    -- priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = false,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        highlight_groups = {
          Comment = { fg = "foam" },
          VertSplit = { fg = "muted", bg = "muted" },
        },
        override = function(c)
          return {
            -- ColorColumn = { bg = c.editor.background },
            -- Mine
            DashboardRecent = { fg = c.base.magenta },
            DashboardProject = { fg = c.base.blue },
            DashboardConfiguration = { fg = c.base.white },
            DashboardSession = { fg = c.base.green },
            DashboardLazy = { fg = c.base.cyan },
            DashboardServer = { fg = c.base.yellow },
            DashboardQuit = { fg = c.base.red },
            IndentBlanklineChar = { fg = c.base.dimmed4 },
            NeoTreeStatusLine = { link = "StatusLine" },
            -- mini.hipatterns
            MiniHipatternsFixme = { fg = c.base.black, bg = c.base.red, bold = true }, -- FIXME
            MiniHipatternsTodo = { fg = c.base.black, bg = c.base.blue, bold = true }, -- TODO
            MiniHipatternsHack = { fg = c.base.black, bg = c.base.yellow, bold = true }, -- HACK
            MiniHipatternsNote = { fg = c.base.black, bg = c.base.green, bold = true }, -- NOTE
            MiniHipatternsWip = { fg = c.base.black, bg = c.base.cyan, bold = true }, -- WIP
          }
        end,
        overridePalette = function(filter)
          -- if filter == "pro" then
          --   return {
          --     dark2 = "#101014",
          --     dark1 = "#16161E",
          --     background = "#1A1B26",
          --     text = "#C0CAF5",
          --     accent1 = "#f7768e",
          --     accent2 = "#7aa2f7",
          --     accent3 = "#e0af68",
          --     accent4 = "#9ece6a",
          --     accent5 = "#0DB9D7",
          --     accent6 = "#9d7cd8",
          --     dimmed1 = "#737aa2",
          --     dimmed2 = "#787c99",
          --     dimmed3 = "#363b54",
          --     dimmed4 = "#363b54",
          --     dimmed5 = "#16161e",
          --   }
          -- end
        end,

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          if highlight.undercurl then
            highlight.undercurl = false
          end
          --
          -- Change palette colour
          if highlight.fg == palette.pine then
            highlight.fg = palette.foam
          end
        end,
      })

      vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end,
  },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    keys = { { "<leader>C", "<cmd>MonokaiProSelect<cr>", desc = "Select Monokai pro filter" } },
    opts = {
      transparent_background = true,
      devicons = true,
      filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
      day_night = {
        enable = true,
        day_filter = "spectrum",
        night_filter = "spectrum",
      },
      inc_search = "background", -- underline | background
      background_clear = {
        "nvim-tree",
        -- "neo-tree",
        "bufferline",
        -- "telescope",
        "toggleterm",
      },
      plugins = {
        bufferline = {
          underline_selected = true,
          underline_visible = false,
          underline_fill = true,
          bold = false,
        },
        indent_blankline = {
          context_highlight = "pro", -- default | pro
          context_start_underline = true,
        },
      },
      override = function(c)
        return {
          -- ColorColumn = { bg = c.editor.background },
          -- Mine
          DashboardRecent = { fg = c.base.magenta },
          DashboardProject = { fg = c.base.blue },
          DashboardConfiguration = { fg = c.base.white },
          DashboardSession = { fg = c.base.green },
          DashboardLazy = { fg = c.base.cyan },
          DashboardServer = { fg = c.base.yellow },
          DashboardQuit = { fg = c.base.red },
          IndentBlanklineChar = { fg = c.base.dimmed4 },
          NeoTreeStatusLine = { link = "StatusLine" },
          -- mini.hipatterns
          MiniHipatternsFixme = { fg = c.base.black, bg = c.base.red, bold = true }, -- FIXME
          MiniHipatternsTodo = { fg = c.base.black, bg = c.base.blue, bold = true }, -- TODO
          MiniHipatternsHack = { fg = c.base.black, bg = c.base.yellow, bold = true }, -- HACK
          MiniHipatternsNote = { fg = c.base.black, bg = c.base.green, bold = true }, -- NOTE
          MiniHipatternsWip = { fg = c.base.black, bg = c.base.cyan, bold = true }, -- WIP
        }
      end,
      overridePalette = function(filter)
        -- if filter == "pro" then
        --   return {
        --     dark2 = "#101014",
        --     dark1 = "#16161E",
        --     background = "#1A1B26",
        --     text = "#C0CAF5",
        --     accent1 = "#f7768e",
        --     accent2 = "#7aa2f7",
        --     accent3 = "#e0af68",
        --     accent4 = "#9ece6a",
        --     accent5 = "#0DB9D7",
        --     accent6 = "#9d7cd8",
        --     dimmed1 = "#737aa2",
        --     dimmed2 = "#787c99",
        --     dimmed3 = "#363b54",
        --     dimmed4 = "#363b54",
        --     dimmed5 = "#16161e",
        --   }
        -- end
      end,
    },
    config = function(_, opts)
      local monokai = require("monokai-pro")
      monokai.setup(opts)
      monokai.load()
    end,
  },
}
