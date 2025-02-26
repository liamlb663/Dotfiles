return {
  'lewis6991/gitsigns.nvim',
  event = { "BufReadPre", "BufNewFile" }, -- Load only when opening a file
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 200,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable for large files
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Keybindings
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc="Next Hunk"})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc="Previous Hunk"})

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, {desc="Stage Hunk"})
        map('n', '<leader>hr', gs.reset_hunk, {desc="Reset Hunk"})
        map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc="Stage Hunk (Visual)"})
        map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc="Reset Hunk (Visual)"})
        map('n', '<leader>hS', gs.stage_buffer, {desc="Stage Buffer"})
        map('n', '<leader>hu', gs.undo_stage_hunk, {desc="Undo Stage Hunk"})
        map('n', '<leader>hR', gs.reset_buffer, {desc="Reset Buffer"})
        map('n', '<leader>hp', gs.preview_hunk, {desc="Preview Hunk"})
        map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc="Blame Line"})
        map('n', '<leader>hd', gs.diffthis, {desc="Diff This"})
        map('n', '<leader>hD', function() gs.diffthis('~') end, {desc="Diff Against Last Commit"})
        map('n', '<leader>ht', gs.toggle_deleted, {desc="Toggle Deleted"})

        -- Toggle Line Blame
        map('n', '<leader>hB', gs.toggle_current_line_blame, {desc="Toggle Line Blame"})
      end
    }
  end
}
