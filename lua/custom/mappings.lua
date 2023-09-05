---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- Highlight every occurence and replace them on the fly
    ["<leader>s"] = {
      ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left><Left>",
      "Highlight every occurence and replace them on the fly",
    },

    ["<leader>oi"] = {
      function()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end,
      "Organize imports",
    },

    ["<C-q>"] = { ":q<CR>", "Exit current view", opts = { nowait = true, silent = true } },
  },

  i = {
    ["<C-H>"] = { "<C-W>", "Delete precedent word", opts = { noremap = true } },
  },

  v = {
    ["gl"] = {
      function()
        local line_start = vim.api.nvim_buf_get_mark(0, "<")[0]
        local line_end = vim.api.nvim_buf_get_mark(0, ">")[0]
        local line_addition = line_end - line_start + 1

        vim.api.nvim_command("G log -L " .. line_start .. ",+" .. line_addition .. ":" .. vim.fn.expand "%")
      end,
      "Git logs a group of lines",
    },
  },
}

-- more keybinds!

return M
