-- luacheck: globals vim

vim.filetype.add({
    pattern = {
        ['.*/%.github[%w/]+workflows[%w/]+.*%.ya?ml'] = 'yaml.ghaction',
    },
})
