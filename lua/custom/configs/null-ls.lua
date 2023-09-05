local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "markdown", "css" },
  }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        -- vim.lsp.buf.format()
        -- local params = {
        --   command = "_typescript.organizeImports",
        --   arguments = { vim.api.nvim_buf_get_name(0) },
        --   title = "",
        -- }
        -- vim.lsp.buf.execute_command(params)
      end,
    })
  end,
}
