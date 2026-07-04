return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    },
  --   config = function()
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "lazygit",
  --       callback = function(args)
  --         -- Remove NvChad terminal ESC mapping for this buffer
  --         pcall(vim.keymap.del, "t", "<Esc>", { buffer = args.buf })
  --
  --         -- Send real ESC to LazyGit
  --         vim.keymap.set("t", "<Esc>", function()
  --           vim.api.nvim_chan_send(vim.b.terminal_job_id, "\27")
  --         end, {
  --           buffer = args.buf,
  --           silent = true,
  --         })
  --       end,
  --     })
  --   end,
  },
}
