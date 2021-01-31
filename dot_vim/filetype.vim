augroup filetypedetect
  autocmd! BufRead,BufNewFile *.Jenkinsfile    set ft=groovy
  autocmd! BufRead,BufNewFile *.hcl            set ft=terraform
  autocmd! BufRead,BufNewFile *.ini.erb        set ft=dosini.eruby
  autocmd! BufRead,BufNewFile *.json.erb       set ft=json.eruby
  autocmd! BufRead,BufNewFile *.lua.erb        set ft=lua.eruby
  autocmd! BufRead,BufNewFile *.pl.erb         set ft=perl.eruby
  autocmd! BufRead,BufNewFile *.properties.erb set ft=jproperties.eruby
  autocmd! BufRead,BufNewFile *.py.erb         set ft=python.eruby
  autocmd! BufRead,BufNewFile *.sh.erb         set ft=sh.eruby
  autocmd! BufRead,BufNewFile *.toml.tmpl      set ft=toml
  autocmd! BufRead,BufNewFile *_Jenkinsfile    set ft=groovy
  autocmd! BufRead,BufNewFile .babelrc         set ft=json
  autocmd! BufRead,BufNewFile .markdownlintrc  set ft=json
  autocmd! BufRead,BufNewFile .yamllint        set ft=yaml
  autocmd! BufRead,BufNewFile Brewfile         set ft=ruby
  autocmd! BufRead,BufNewFile Jenkinsfile      set ft=groovy
  autocmd! BufRead,BufNewFile Vagrantfile      set ft=ruby
  autocmd! BufRead,BufNewFile dhcpd.conf.j2    set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile dot_bash_profile set ft=sh
  autocmd! BufRead,BufNewFile dot_bashrc       set ft=sh
  autocmd! BufRead,BufNewFile nftables.conf.j2 set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile nsd.conf.j2      set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile rad.conf.j2      set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile unbound.conf.j2  set noet sw=8 ts=8

  autocmd! BufRead,BufNewFile \(encrypted_\|private_\|empty_\|executable_\|dot_\)*netrc\(.tmpl\)* set ft=netrc
augroup END
