if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd! BufRead,BufNewFile *.json.tmpl          set filetype=json.gohtmltmpl
  autocmd! BufRead,BufNewFile *.md.tmpl            set filetype=markdown.gohtmltmpl
  autocmd! BufRead,BufNewFile *.sh.tmpl            set filetype=sh.gohtmltmpl
  autocmd! BufRead,BufNewFile *.toml.tmpl          set filetype=toml.gohtmltmpl
  autocmd! BufRead,BufNewFile *.vim.tmpl           set filetype=vim.gohtmltmpl
  autocmd! BufRead,BufNewFile *.yaml.tmpl          set filetype=yaml.gohtmltmpl
  autocmd! BufRead,BufNewFile .ansible-lint        set filetype=yaml
  autocmd! BufRead,BufNewFile .chezmoiignore       set filetype=gitignore
  autocmd! BufRead,BufNewFile .envrc.example       set filetype=direnv
  autocmd! BufRead,BufNewFile .gomplateignore      set filetype=gitignore
  autocmd! BufRead,BufNewFile .markdownlintignore  set filetype=gitignore
  autocmd! BufRead,BufNewFile .markdownlintrc      set filetype=json
  autocmd! BufRead,BufNewFile .markdownlintrc.tmpl set filetype=json.gohtmltmpl
  autocmd! BufRead,BufNewFile .prettierignore      set filetype=gitignore
  autocmd! BufRead,BufNewFile .prettierrc          set filetype=yaml
  autocmd! BufRead,BufNewFile .prettierrc.tmpl     set filetype=yaml.gohtmltmpl
  autocmd! BufRead,BufNewFile .yamllint            set filetype=yaml
  autocmd! BufRead,BufNewFile .yamllint.tmpl       set filetype=yaml.gohtmltmpl
  autocmd! BufRead,BufNewFile Vagrantfile          set filetype=ruby
  autocmd! BufRead,BufNewFile unbound.conf.j2      set noexpandtab shiftwidth=8 tabstop=8
augroup END
