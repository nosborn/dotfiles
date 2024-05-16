if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd! BufNewFile,BufRead *-config.alloy           set filetype=river
  autocmd! BufNewFile,BufRead *.env                    set filetype=dottenv syntax=sh
  autocmd! BufNewFile,BufRead .chezmoiignore           set filetype=gitignore
  autocmd! BufNewFile,BufRead .envrc.ignore            set filetype=direnv
  autocmd! BufNewFile,BufRead .markdownlintignore      set filetype=gitignore
  autocmd! BufNewFile,BufRead .markdownlintrc          set filetype=json
  autocmd! BufNewFile,BufRead .prettierignore          set filetype=gitignore
  autocmd! BufNewFile,BufRead .prettierrc              set filetype=yaml
  autocmd! BufNewFile,BufRead .yamllint                set filetype=yaml
  autocmd! BufNewFile,BufRead CODEOWNERS               set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufNewFile,BufRead ansible-lint             set filetype=yaml
  autocmd! BufNewFile,BufRead config.alloy             set filetype=river
  autocmd! BufNewFile,BufRead dot_editorconfig         set filetype=editorconfig
  autocmd! BufNewFile,BufRead tsconfig.json            set filetype=jsonc
  autocmd! BufNewFile,BufRead unbound.conf.d/*.conf.j2 set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufNewFile,BufRead unbound.conf.j2          set noexpandtab shiftwidth=8 tabstop=8
augroup END
