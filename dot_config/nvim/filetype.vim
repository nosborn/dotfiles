augroup filetypedetect
  autocmd! BufRead,BufNewFile *.Jenkinsfile         set filetype=groovy
  autocmd! BufRead,BufNewFile *.hcl                 set filetype=terraform
  autocmd! BufRead,BufNewFile *.ini.erb             set filetype=dosini.eruby
  autocmd! BufRead,BufNewFile *.json.erb            set filetype=json.eruby
  autocmd! BufRead,BufNewFile *.lua.erb             set filetype=lua.eruby
  autocmd! BufRead,BufNewFile *.pl.erb              set filetype=perl.eruby
  autocmd! BufRead,BufNewFile *.properties.erb      set filetype=jproperties.eruby
  autocmd! BufRead,BufNewFile *.py.erb              set filetype=python.eruby
  autocmd! BufRead,BufNewFile *.sh.erb              set filetype=sh.eruby
  autocmd! BufRead,BufNewFile *.toml.tmpl           set filetype=toml
  autocmd! BufRead,BufNewFile */ansible/*/02-static set filetype=dosini
  autocmd! BufRead,BufNewFile *_Jenkinsfile         set filetype=groovy
  autocmd! BufRead,BufNewFile *_netrc.tmpl          set filetype=netrc
  autocmd! BufRead,BufNewFile .babelrc              set filetype=json
  autocmd! BufRead,BufNewFile .markdownlintrc       set filetype=json
  autocmd! BufRead,BufNewFile .yamllint             set filetype=yaml
  autocmd! BufRead,BufNewFile Brewfile              set filetype=ruby
  autocmd! BufRead,BufNewFile Jenkinsfile           set filetype=groovy
  autocmd! BufRead,BufNewFile Vagrantfile           set filetype=ruby
  autocmd! BufRead,BufNewFile dhcpd.conf.j2         set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufRead,BufNewFile dot_bash_profile      set filetype=sh
  autocmd! BufRead,BufNewFile dot_bashrc            set filetype=sh
  autocmd! BufRead,BufNewFile nftables.conf.j2      set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufRead,BufNewFile nsd.conf.j2           set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufRead,BufNewFile rad.conf.j2           set noexpandtab shiftwidth=8 tabstop=8
  autocmd! BufRead,BufNewFile unbound.conf.j2       set noexpandtab shiftwidth=8 tabstop=8
augroup END
