" if exists('did_load_filetypes')
"   finish
" endif

augroup filetypedetect
  autocmd BufRead,BufNewFile *.tmTheme           set filetype=xml
  autocmd BufRead,BufNewFile .ansible-lint       set filetype=yaml
  autocmd BufRead,BufNewFile .chezmoiignore      set filetype=gitignore
  autocmd BufRead,BufNewFile .envrc.example      set filetype=direnv
  autocmd BufRead,BufNewFile .gomplateignore     set filetype=gitignore
  autocmd BufRead,BufNewFile .markdownlintignore set filetype=gitignore
  autocmd BufRead,BufNewFile .markdownlintrc     set filetype=json
  autocmd BufRead,BufNewFile .prettierignore     set filetype=gitignore
  autocmd BufRead,BufNewFile .prettierrc         set filetype=yaml
  autocmd BufRead,BufNewFile .yamllint           set filetype=yaml
  autocmd BufRead,BufNewFile CODEOWNERS          set noexpandtab shiftwidth=8 tabstop=8
  autocmd BufRead,BufNewFile Vagrantfile         set filetype=ruby
  autocmd BufRead,BufNewFile tsconfig.json       set filetype=jsonc
  autocmd BufRead,BufNewFile unbound.conf.j2     set noexpandtab shiftwidth=8 tabstop=8
augroup END
