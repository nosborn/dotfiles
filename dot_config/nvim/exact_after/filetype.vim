augroup filetypedetect
  autocmd! BufRead,BufNewFile *.hcl.tmpl                 set filetype=hcl.gotexttmpl
  autocmd! BufRead,BufNewFile *.json.tmpl                set filetype=json.gotexttmpl
  autocmd! BufRead,BufNewFile *.lua.tmpl                 set filetype=lua.gotexttmpl
  autocmd! BufRead,BufNewFile *.md.tmpl                  set filetype=markdown.gotexttmpl
  autocmd! BufRead,BufNewFile *.plist.tmpl               set filetype=xml.gotexttmpl
  autocmd! BufRead,BufNewFile *.sh.tmpl                  set filetype=sh.gotexttmpl
  autocmd! BufRead,BufNewFile *.toml.tmpl                set filetype=toml.gotexttmpl
  autocmd! BufRead,BufNewFile *.vim.tmpl                 set filetype=vim.gotexttmpl
  autocmd! BufRead,BufNewFile *.yaml.tmpl                set filetype=yaml.gotexttmpl
  autocmd! BufRead,BufNewFile *.yml.tmpl                 set filetype=yaml.gotexttmpl
  autocmd! BufRead,BufNewFile *.zsh.tmpl                 set filetype=zsh.gotexttmpl
  autocmd! BufRead,BufNewFile */.github/workflows/*.yaml set filetype=yaml.actionlint
  autocmd! BufRead,BufNewFile */.github/workflows/*.yml  set filetype=yaml.actionlint
  autocmd! BufRead,BufNewFile .markdownlintignore.tmpl   set filetype=gitignore.gotexttmpl
  autocmd! BufRead,BufNewFile .markdownlintrc.tmpl       set filetype=json.gotexttmpl
  autocmd! BufRead,BufNewFile .prettierignore.tmpl       set filetype=gitignore.gotexttmpl
  autocmd! BufRead,BufNewFile .prettierrc.tmpl           set filetype=yaml.gotexttmpl
  autocmd! BufRead,BufNewFile .yamllint.tmpl             set filetype=yaml.gotexttmpl
augroup END
