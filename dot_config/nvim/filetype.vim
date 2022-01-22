augroup filetypedetect
  autocmd! BufRead,BufNewFile *.hcl                      set filetype=hcl
  autocmd! BufRead,BufNewFile *.toml.tmpl                set filetype=toml.gotexttmpl
  autocmd! BufRead,BufNewFile *.vim.tmpl                 set filetype=vim.gotexttmpl
  autocmd! BufRead,BufNewFile *_netrc.tmpl               set filetype=netrc
  autocmd! BufRead,BufNewFile .ansible-lint              set filetype=yaml
  autocmd! BufRead,BufNewFile .envrc.example             set filetype=direnv
  autocmd! BufRead,BufNewFile .markdownlintrc            set filetype=json
  autocmd! BufRead,BufNewFile .yamllint                  set filetype=yaml
  autocmd! BufRead,BufNewFile Brewfile                   set filetype=ruby
  autocmd! BufRead,BufNewFile Jenkinsfile                set filetype=groovy
  autocmd! BufRead,BufNewFile Vagrantfile                set filetype=ruby
  autocmd! BufRead,BufNewFile unbound.conf.j2            set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufRead,BufNewFile *.tf,*.tfvars              set filetype=terraform
  autocmd! BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
  autocmd! BufRead,BufNewFile .terraformrc,terraform.rc  set filetype=hcl
augroup END
