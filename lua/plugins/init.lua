return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right",
      },
    },
  },
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- Added: Persistent inline git blame configuration
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Kept open permanently
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- Placed at the end of the line
        delay = 100,           -- Shows up almost instantly (100ms)
      },
    },
  },
}
