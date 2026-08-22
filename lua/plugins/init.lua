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
      filters = {
        dotfiles = false,     -- Show hidden/dotfiles by default
        git_ignored = false,  -- Show files ignored by .gitignore by default
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


  {
    "nvim-telescope/telescope.nvim",
      opts = function()
  -- Fetch NvChad's underlying default configuration
  local opts = require "nvchad.configs.telescope"

  -- Merge our custom ignore patterns into the default options
  opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
    file_ignore_patterns = {
      "%.git/", -- Completely hides the internal .git folder
      "%.git$", -- Hides standard loose .git references
    },
  })

  return opts
      end,
    },
    
 {
    "akinsho/toggleterm.nvim",
    version = '*',
    -- 🛑 ADD THESE TWO LINES TO FIX THE E492 ERROR:
    cmd = { "ToggleTerm", "ToggleTermToggleAll", "ToggleTermSendVisualLines", "ToggleTermSendVisualSelection" },
    keys = { [[<c-\>]] }, 
    config = function()
      require("toggleterm").setup {
        size = 15,
        open_mapping = [[<c-\>]], -- Press Ctrl + \ to toggle it open/closed
        direction = "horizontal", -- Opens at the bottom like VSCode
        shade_terminals = true,
        persist_size = true,
      }
    end
  },
}
