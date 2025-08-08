local M = {}

local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

-- File to store history
local history_file = vim.fn.stdpath("data") .. "/recent_files.txt"

-- Read files from history
local function read_recent_files()
  local files = {}
  local f = io.open(history_file, "r")
  if f then
    for line in f:lines() do
      if vim.fn.filereadable(line) == 1 then
        table.insert(files, line)
      end
    end
    f:close()
  end
  return files
end

-- Write a file to history
local function write_recent_file(path)
  if not path or path == "" then return end
  local files = read_recent_files()
  for i = #files, 1, -1 do
    if files[i] == path then
      table.remove(files, i)
    end
  end
  table.insert(files, 1, path)
  while #files > 50 do
    table.remove(files)
  end

  local f = io.open(history_file, "w")
  if f then
    for _, file in ipairs(files) do
      f:write(file .. "\n")
    end
    f:close()
  end
end

-- Picker
function M.open_picker()
  local files = read_recent_files()
  local top5 = {}
  for i = 1, math.min(5, #files) do
    table.insert(top5, files[i])
  end

  if #top5 == 0 then
    vim.notify("No recent files found.", vim.log.levels.INFO)
    return
  end

  pickers.new({}, {
    prompt_title = "Recent Files",
    finder = finders.new_table {
      results = top5,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close()
        vim.cmd("edit " .. vim.fn.fnameescape(entry[1]))
      end)
      return true
    end,
  }):find()
end

-- Autocommand to track files
function M.setup()
  vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
      local file = vim.api.nvim_buf_get_name(args.buf)
      if vim.fn.filereadable(file) == 1 then
        write_recent_file(file)
      end
    end
  })

  -- Optionally call picker on startup:
  -- vim.defer_fn(M.open_picker, 100)
end

return M

