local function matches(pattern, text) return vim.regex(pattern):match_str(text) ~= nil end

local function is_ansible()
    local filepath = vim.fn.expand('%:p')
    local filename = vim.fn.expand('%:t')

    if matches([[\v/(tasks|roles|handlers)/.*\.ya?ml$]], filepath) then return true end

    if matches([[\v/(group|host)_vars/]], filepath) then return true end

    local filename_regex = vim.g.ansible_ftdetect_filename_regex
        or [[\v(playbook|site|main|local|requirements)\.ya?ml$]]

    if matches(filename_regex, filename) then return true end

    local first_line = (vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or '')
    if matches([[^#!.*/bin/env\s\+ansible-playbook\>]], first_line) then return true end
    if matches([[^#!.*/bin/ansible-playbook\>]], first_line) then return true end

    return false
end

local function setup_template()
    local syntaxes = vim.g.ansible_template_syntaxes
    if type(syntaxes) == 'table' then
        local filepath = vim.fn.expand('%:p')
        for pattern, filetype in pairs(syntaxes) do
            if matches([[\v/]] .. pattern, filepath) then
                vim.bo.filetype = filetype .. '.jinja2'
                return
            end
        end
    end

    vim.bo.filetype = 'jinja2'
end

local group_yaml = vim.api.nvim_create_augroup('ansible_vim_ftyaml_ansible', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group_yaml,
    pattern = '*',
    callback = function()
        if is_ansible() then vim.bo.filetype = 'yaml.ansible' end
    end,
})

local group_jinja = vim.api.nvim_create_augroup('ansible_vim_ftjinja2', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group_jinja,
    pattern = '*.j2',
    callback = setup_template,
})

local group_hosts = vim.api.nvim_create_augroup('ansible_vim_fthosts', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group_hosts,
    pattern = 'hosts',
    callback = function() vim.bo.filetype = 'ansible_hosts' end,
})
