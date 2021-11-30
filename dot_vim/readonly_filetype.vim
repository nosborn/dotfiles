augroup filetypedetect
  autocmd! BufRead,BufNewFile *.hcl                                         set filetype=terraform
  autocmd! BufRead,BufNewFile *.toml.tmpl                                   set filetype=toml.gotexttmpl
  autocmd! BufRead,BufNewFile *.vim.tmpl                                    set filetype=vim.gotexttmpl
  autocmd! BufRead,BufNewFile */.github/workflows/*.yml                     set filetype=yaml
  autocmd! BufRead,BufNewFile */SynoBuildConf/depends                       set ft=dosini
  autocmd! BufRead,BufNewFile */synology-packages/source/*/conf/privilege   set ft=json
  autocmd! BufRead,BufNewFile */synology-packages/source/*/conf/resource    set ft=json
  autocmd! BufRead,BufNewFile */synology-packages/source/*/ui/config        set ft=json
  autocmd! BufRead,BufNewFile */synology-packages/source/*/WIZARD_UIFILES/* set ft=json
  autocmd! BufRead,BufNewFile *_netrc.tmpl                                  set filetype=netrc
  autocmd! BufRead,BufNewFile .ansible-lint                                 set filetype=yaml
  autocmd! BufRead,BufNewFile .envrc.example                                set filetype=direnv
  autocmd! BufRead,BufNewFile .markdownlintrc                               set filetype=json
  autocmd! BufRead,BufNewFile .yamllint                                     set filetype=yaml
  autocmd! BufRead,BufNewFile Brewfile                                      set filetype=ruby
  autocmd! BufRead,BufNewFile Jenkinsfile                                   set filetype=groovy
  autocmd! BufRead,BufNewFile Vagrantfile                                   set filetype=ruby
  autocmd! BufRead,BufNewFile unbound.conf.j2                               set noexpandtab shiftwidth=8 tabstop=8
augroup END
