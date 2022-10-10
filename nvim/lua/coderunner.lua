-- more information:
-- https://www.reddit.com/r/neovim/comments/qe8404/setting_up_custom_keybind_for_each_file_type/

-- thansk to @seblj for this wonderful function template
-- https://github.com/seblj/dotfiles/blob/6e3fc53daa46d520f777679d7e68b39289598360/nvim/lua/seblj/utils/init.lua#L113

-- thansk to @eastarpen for this wonderful function template
-- https://github.com/eastarpen/dotfiles/blob/ccb15efdadc268d2a7949948b84e680bdb0856d6/nvim/lua/coderunner.lua

local eval = vim.api.nvim_eval

local M = {}

M.run_term = function(command, ...)
    vim.cmd('term')
    vim.cmd('set nonumber')
    vim.cmd('set norelativenumber')
    local terminal_id = eval('b:terminal_job_id')
    vim.api.nvim_chan_send(terminal_id, string.format(command .. '\n\r', ...))
    vim.cmd('set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20')
    vim.cmd('start')
    -- vim.cmd('stopinsert')
end

-- Save and execute file based on filetype
M.exec = function()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local isWin = vim.fn.has('win32') or vim.fn.has("win64")
    vim.cmd('silent! write')
    if ft == 'vim' or ft == 'lua' then
        vim.cmd('source %')
    elseif ft == 'python' then
        vim.cmd('sp')
        M.run_term('python3 %s', vim.fn.expand('%'))
    elseif ft == 'cpp' or ft == 'c' then
        vim.cmd('sp')
        local file = vim.fn.expand('%')
        local output = vim.fn.expand('%:t:r')
        local command = ' -g %s -o %s && ./%s > data.out < data.in; rm %s'
        if isWin == 1 then
            output = output .. '.exe'
            command = ' -g %s -o %s && %s > data.out < data.in; del %s'
        end
        if ft == 'cpp' then
            command = 'g++' .. command
        else
            command = 'gcc' .. command
        end

        -- run in terminal 
        -- M.run_term(command, file, output, output, output)

        -- run silently
        vim.cmd("silent exec '!" .. string.format(command, file, output,
                        output,output) .. "'")
        vim.cmd("e data.out")
    end
end

-- debug(cpp only)
M.debug = function ()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local isWin = vim.fn.has('win32') or vim.fn.has("win64")
    vim.cmd('silent! write')
    if ft == 'cpp' or ft == 'c' then
        vim.cmd('sp')
        local file = vim.fn.expand('%')
        local output = vim.fn.expand('%:t:r')
        local command = ' -g %s -o %s && ./%s;'
        if isWin == 1 then
            output = output .. '.exe'
            command = ' -g %s -o %s && %ss'
        end
        if ft == 'cpp' then
            command = 'g++' .. command
        else
            command = 'gcc' .. command
        end
        -- compile
        vim.cmd("silent exec '!" .. string.format(command, file, output, output,output) .. "'")
        M.run_term("gdb "..output)
    end
end

return M
