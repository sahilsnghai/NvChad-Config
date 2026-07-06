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

    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lazygit",
        callback = function(args)
          -- Remove NvChad terminal ESC mapping for this buffer
          pcall(vim.keymap.del, "t", "<Esc>", { buffer = args.buf })

          -- Send real ESC to LazyGit instead of leaving terminal mode
          vim.keymap.set("t", "<Esc>", function()
            local chan = vim.b[args.buf].terminal_job_id
            if chan then
              vim.api.nvim_chan_send(chan, "\27")
            end
          end, {
            buffer = args.buf,
            silent = true,
            desc = "Send ESC to LazyGit",
          })
        end,
      })
    end,
  },
}
