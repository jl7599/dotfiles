local M = {
  "neovim/nvim-lspconfig",
  branch = "master",
}
M.config = function()
  vim.api.nvim_create_autocmd("BufWritePre", {
      -- buffer = buffer,
      callback = function()
          vim.lsp.buf.format { async = false }
      end
  })

  vim.lsp.config('ruff', {
    init_options = {
      settings = {
        -- Ruff language server settings go here
        configuration = "~/.config/python/ruff.toml"
      }
    }
  })

  vim.lsp.enable('ruff')
end

return M
