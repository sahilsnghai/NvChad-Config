require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- =========================
-- ✅ YOUR CUSTOM KEYMAPS
-- =========================

-- 🔁 Ctrl + Q → toggle focus between tree and editor
-- map("n", "<C-q>", function()
--   local api = require("nvim-tree.api")
--   local view = require("nvim-tree.view")
--
--   if view.is_visible() and view.get_winnr() == vim.api.nvim_get_current_win() then
--     vim.cmd("wincmd l") -- move to file
--   else
--     api.tree.focus() -- move to tree
--   end
-- end, { desc = "Toggle focus tree <-> file" })


map("n", "<C-g>", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_set_current_buf(buf)
      return
    end
  end
  vim.cmd("terminal")
end, { desc = "Toggle terminal" })


map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

-- 🔙 Escape from terminal mode using ESC
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })


map("n", "<C-j>", "<C-d>", { desc = "Scroll Down" })
map("n", "<C-k>", "<C-u>", { desc = "Scroll Up" })

--
-- local function continuous_resize(cmd, incr_key, decr_key)
--   return function()
--     vim.cmd(cmd) -- Trigger initial window adjustment
--
--     while true do
--       local ok, char = pcall(vim.fn.getchar)
--       if not ok then break end
--
--       local key = type(char) == "number" and vim.fn.nr2char(char) or char
--
--       -- Let '.'/Up increase and ','/Down decrease height
--       if key == incr_key or char == "\27[1;3A" then       -- Option + Up Arrow
--         vim.cmd("resize +7")
--       elseif key == decr_key or char == "\27[1;3B" then     -- Option + Down Arrow
--         vim.cmd("resize -7")
--       elseif key == "\27" then                            -- Exit when <Esc> is hit
--         break
--       else
--         vim.api.nvim_feedkeys(key, "m", true)
--         break
--       end
--     end
--   end
-- end
--
-- -- Keybindings: Press Option + Up Arrow or Option + Down Arrow
-- map("n", "<A-Up>", continuous_resize("resize +7", ".", ","), { desc = "Continuous increase height" })
-- map("n", "<A-Down>", continuous_resize("resize -7", ".", ","), { desc = "Continuous decrease height" })


map("n", "<A-Up>", function()
  vim.cmd("resize +7")
end)

map("n", "<A-Down>", function()
  vim.cmd("resize -7")
end)

map("n", "<A-Right>", function()
  vim.cmd("vertical resize +7")
end)

map("n", "<A-Left>", function()
  vim.cmd("vertical resize -7")
end)
--

map("n", "<A-w>", function() require("nvchad.tabufline").close_buffer() end, { desc = "Close current buffer" })

map("t", "<A-q>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, true, true), "n", false)
  
  for _ = 1, #vim.api.nvim_tabpage_list_wins(0) do
    vim.cmd("wincmd w")
    if vim.bo.filetype ~= "NvimTree" then
      break
    end
  end
end, { desc = "Exit terminal directly to code buffer" })

map("n", "<A-q>", function()
  local start_win = vim.api.nvim_get_current_win()
  
  for _ = 1, #vim.api.nvim_tabpage_list_wins(0) do
    vim.cmd("wincmd w")
    
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
      return
    end
  end
  
  vim.api.nvim_set_current_win(start_win)
end, { desc = "Jump directly from buffer into terminal" })



-- map({ "n", "v" }, "<A>", "<leader>", { remap = true })


-- New Alt mappings (<M-f> means Alt+f)
map("n", "<A-f><A-f>", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find Files" })
map("n", "<A-f><A-a>", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", { desc = "Telescope Find All Files" })
map("n", "<A-f><A-w>", "<cmd>Telescope live_grep<cr>", { desc = "Telescope Live Grep" })
map("n", "<A-f><A-z>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Telescope Find in Current Buffer" })

-- Unbind the default NvChad Space mappings
-- vim.keymap.del("n", "<leader>ff")
-- vim.keymap.del("n", "<leader>fa")
-- vim.keymap.del("n", "<leader>fw")
-- vim.keymap.del("n", "<leader>fz")
