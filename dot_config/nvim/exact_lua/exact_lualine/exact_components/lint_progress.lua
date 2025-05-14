local function lint_progress()
    local linters = require('lint').get_running()
    if #linters == 0 then
        return '󰦕'
    end
    return '󱉶 ' .. table.concat(linters, ', ')
end
