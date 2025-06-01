local cache_path = vim.fn.stdpath 'cache'
local pipe_path = cache_path .. '/godot.pipe'

-- Check if cache directory exists, create it if it doesn't
if not vim.loop.fs_stat(cache_path) then
    vim.fn.mkdir(cache_path, 'p') -- 'p' ensures parent directories are created if needed
end

-- Check if pipe file exists, start server if it doesn't
if not vim.loop.fs_stat(pipe_path) then
    vim.fn.serverstart(pipe_path)
end
