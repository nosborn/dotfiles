if vim.g.loaded_nvim_treesitter then
    return
end
vim.g.loaded_nvim_treesitter = true

local filetypes = {
    angular = { 'htmlangular' },
    bash = { 'sh' },
    bibtex = { 'bib' },
    c_sharp = { 'cs', 'csharp' },
    commonlisp = { 'lisp' },
    cooklang = { 'cook' },
    devicetree = { 'dts' },
    diff = { 'gitdiff' },
    eex = { 'eelixir' },
    elixir = { 'ex' },
    embedded_template = { 'eruby' },
    erlang = { 'erl' },
    facility = { 'fsd' },
    faust = { 'dsp' },
    gdshader = { 'gdshaderinc' },
    git_commit = { 'gitcommit' },
    git_rebase = { 'gitrebase' },
    glimmer = { 'handlebars', 'html.handlebars' },
    glimmer_javascript = { 'javascript.glimmer' },
    glimmer_typescript = { 'typescript.glimmer' },
    godot_resource = { 'gdresource' },
    haskell = { 'hs' },
    haskell_persistent = { 'haskellpersistent' },
    idris = { 'idris2' },
    ini = { 'confini', 'dosini' },
    janet_simple = { 'janet' },
    javascript = { 'ecma', 'ecmascript', 'javascriptreact', 'js', 'jsx' },
    json = { 'jsonc' },
    latex = { 'tex' },
    linkerscript = { 'ld' },
    m68k = { 'asm68k' },
    make = { 'automake' },
    markdown = { 'pandoc' },
    muttrc = { 'neomuttrc' },
    ocaml_interface = { 'ocamlinterface' },
    poe_filter = { 'poefilter' },
    powershell = { 'ps1' },
    properties = { 'jproperties' },
    python = { 'gyp' },
    qmljs = { 'qml' },
    runescript = { 'clientscript' },
    scala = { 'sbt' },
    slang = { 'shaderslang' },
    sqp = { 'mysqp' },
    ssh_config = { 'sshconfig' },
    starlark = { 'bzl' },
    surface = { 'sface' },
    systemverilog = { 'verilog' },
    t32 = { 'trace32' },
    tcl = { 'expect' },
    terraform = { 'terraform-vars' },
    textproto = { 'pbtxt' },
    tlaplus = { 'tla' },
    tsx = { 'typescript.tsx', 'typescriptreact' },
    typst = { 'typ' },
    udev = { 'udevrules' },
    uxntal = { 'tal', 'uxn' },
    v = { 'vlang' },
    vhs = { 'tape' },
    xml = { 'svg', 'xsd', 'xslt' },
}

for lang, filetype in pairs(filetypes) do
    vim.treesitter.language.register(lang, filetype)
end

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
