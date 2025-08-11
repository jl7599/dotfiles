local fn = vim.fn

return {
  "akinsho/toggleterm.nvim",
  config = function()
    -- config
    require("toggleterm").setup({
      options = {
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        start_in_insert = true,
        insert_mappings = true, -- Enable default insert mode mappings
        terminal_mappings = true,
      },
    })

    -- custom keymap
    vim.cmd([[
      " set
      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

      " By applying the mappings this way you can pass a count to your
      " mapping to open a specific window.
      " For example: 2<C-t> will open terminal 2
      nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
      inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
    ]])
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end
    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

    local float_handler = function(term)
      if not falsy(fn.mapcheck("jk", "t")) then
        vim.keymap.del("t", "jk", { buffer = term.bufnr })
        vim.keymap.del("t", "<esc>", { buffer = term.bufnr })
      end
    end

    local Terminal = require("toggleterm.terminal").Terminal

    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      hidden = true,
      direction = "float",
      float_opts = {
        width = vim.o.columns,
        height = vim.o.lines,
        border = "single",
      },
      on_open = float_handler,
    })

    vim.keymap.set("n", "<leader>gs", function()
      lazygit:toggle()
    end, {
      desc = "toggleterm: toggle lazygit",
    })
  end,
}
