if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd! BufNewFile,BufRead **/.config/flake8          set filetype=dosini
  autocmd! BufNewFile,BufRead **/.config/git/safe.inc    set filetype=gitconfig
  autocmd! BufNewFile,BufRead **/.config/yamllint/config set filetype=yaml
  autocmd! BufNewFile,BufRead *.alloy                    set filetype=river
  autocmd! BufNewFile,BufRead *.env                      set filetype=dotenv syntax=sh
  autocmd! BufNewFile,BufRead *.ini.j2                   set filetype=dosini.jinja2
  autocmd! BufNewFile,BufRead *.json.j2                  set filetype=json.jinja2
  autocmd! BufNewFile,BufRead *.yaml.j2                  set filetype=yaml.jinja2
  autocmd! BufNewFile,BufRead *.yml.j2                   set filetype=yaml.jinja2
  autocmd! BufNewFile,BufRead .Brewfile                  set filetype=ruby
  autocmd! BufNewFile,BufRead .ansible-lint              set filetype=yaml
  autocmd! BufNewFile,BufRead .chezmoiignore             set filetype=gitignore
  autocmd! BufNewFile,BufRead .envrc.ignore              set filetype=direnv
  autocmd! BufNewFile,BufRead .markdownlintignore        set filetype=gitignore
  autocmd! BufNewFile,BufRead .markdownlintrc            set filetype=json
  autocmd! BufNewFile,BufRead .prettierignore            set filetype=gitignore
  autocmd! BufNewFile,BufRead .prettierrc                set filetype=yaml
  autocmd! BufNewFile,BufRead .yamlfmt                   set filetype=yaml
  autocmd! BufNewFile,BufRead .yamllint                  set filetype=yaml
  autocmd! BufNewFile,BufRead CODEOWNERS                 set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufNewFile,BufRead pylintrc                   set filetype=dosini
  autocmd! BufNewFile,BufRead tsconfig.json              set filetype=jsonc
  autocmd! BufNewFile,BufRead unbound.conf.d/*.conf.j2   set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufNewFile,BufRead unbound.conf.j2            set noexpandtab shiftwidth=8 tabstop=8
augroup END
