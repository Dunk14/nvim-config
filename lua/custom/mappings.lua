---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- Highlight every occurence and replace them on the fly
    ["<leader>s"] = {
      ":%s/<c<C-r><C-w>>/<C-r><C-w>/g<Left><Left><Left>",
      "Highlight every occurence and replace them on the fly",
    },
  },
}

-- more keybinds!

return M
