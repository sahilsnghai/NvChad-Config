-- lua/plugins/neominimap.lua
return {
  {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    lazy = false,
    init = function()
      -- 1. Configure the minimap layout and options via global variable
      vim.g.neominimap = {
        auto_enable = true,
        sync_cursor = true, -- CRITICAL: Forces the minimap to track and display your cursor
        git = {
          enabled = true,   -- Tracks git hooks changes
        },
      }

      -- 2. Core layout constraints
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36

      -- 3. High-visibility cursor tracking highlights
      local function apply_minimap_highlights()
        -- Directly assigns a visible background color block to the map cursor tracker
        -- 'fg' sets the text color, 'bg' gives it a distinct row background color block
        vim.api.nvim_set_hl(0, "NeominimapCursorLine", { bg = "#2e3440", fg = "#81a1c1", bold = true })
        vim.api.nvim_set_hl(0, "NeominimapCursorLineNr", { fg = "#a3be8c", bold = true })
      end

      -- Re-apply when changing themes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = apply_minimap_highlights,
      })
      
      -- Apply immediately on startup
      apply_minimap_highlights()
    end,
  },
}
