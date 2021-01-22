if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
<<<<<<< Updated upstream
  au! BufRead,BufNewFile *.Jenkinsfile                 set ft=groovy
  au! BufRead,BufNewFile *.ini.erb                     set ft=dosini.eruby
  au! BufRead,BufNewFile *.json.erb                    set ft=json.eruby
  au! BufRead,BufNewFile *.lua.erb                     set ft=lua.eruby
  au! BufRead,BufNewFile *.pl.erb                      set ft=perl.eruby
  au! BufRead,BufNewFile *.properties.erb              set ft=jproperties.eruby
  au! BufRead,BufNewFile *.py.erb                      set ft=python.eruby
  au! BufRead,BufNewFile *.sh.erb                      set ft=sh.eruby
  au! BufRead,BufNewFile *.toml.tmpl                   set ft=toml
  au! BufRead,BufNewFile */ansible/templates/nginx/*   set ft=nginx
  au! BufRead,BufNewFile */terraform/**/*.rules        set ft=markdown nospell nowrap
  au! BufRead,BufNewFile *_Jenkinsfile                 set ft=groovy
  au! BufRead,BufNewFile .babelrc                      set ft=json
  au! BufRead,BufNewFile .markdownlintrc               set ft=json
  au! BufRead,BufNewFile .yamllint                     set ft=yaml
  au! BufRead,BufNewFile Brewfile                      set ft=ruby
  au! BufRead,BufNewFile Jenkinsfile                   set ft=groovy
  au! BufRead,BufNewFile Vagrantfile                   set ft=ruby
  au! BufRead,BufNewFile dhcpd.conf.j2                 set noet sw=8 ts=8
" au! BufRead,BufNewFile direnvrc                      set ft=sh
  au! BufRead,BufNewFile dot_bash_profile              set ft=sh
  au! BufRead,BufNewFile dot_bashrc                    set ft=sh
  au! BufRead,BufNewFile nftables.conf.j2              set noet sw=8 ts=8
  au! BufRead,BufNewFile nsd.conf.j2                   set noet sw=8 ts=8
  au! BufRead,BufNewFile rad.conf.j2                   set noet sw=8 ts=8
  au! BufRead,BufNewFile unbound.conf.j2               set noet sw=8 ts=8
=======
  autocmd! BufRead,BufNewFile *.Jenkinsfile          set ft=groovy
  autocmd! BufRead,BufNewFile *.ini.erb              set ft=dosini.eruby
  autocmd! BufRead,BufNewFile *.json.erb             set ft=json.eruby
  autocmd! BufRead,BufNewFile *.lua.erb              set ft=lua.eruby
  autocmd! BufRead,BufNewFile *.pl.erb               set ft=perl.eruby
  autocmd! BufRead,BufNewFile *.properties.erb       set ft=jproperties.eruby
  autocmd! BufRead,BufNewFile *.py.erb               set ft=python.eruby
  autocmd! BufRead,BufNewFile *.sh.erb               set ft=sh.eruby
  autocmd! BufRead,BufNewFile *.toml.tmpl            set ft=toml
  autocmd! BufRead,BufNewFile */terraform/**/*.rules set ft=markdown nospell nowrap
  autocmd! BufRead,BufNewFile *_Jenkinsfile          set ft=groovy
  autocmd! BufRead,BufNewFile .babelrc               set ft=json
  autocmd! BufRead,BufNewFile .markdownlintrc        set ft=json
  autocmd! BufRead,BufNewFile .yamllint              set ft=yaml
  autocmd! BufRead,BufNewFile Brewfile               set ft=ruby
  autocmd! BufRead,BufNewFile Jenkinsfile            set ft=groovy
  autocmd! BufRead,BufNewFile Vagrantfile            set ft=ruby
  autocmd! BufRead,BufNewFile dhcpd.conf.j2          set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile dot_bash_profile       set ft=sh
  autocmd! BufRead,BufNewFile dot_bashrc             set ft=sh
  autocmd! BufRead,BufNewFile nftables.conf.j2       set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile nsd.conf.j2            set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile rad.conf.j2            set noet sw=8 ts=8
  autocmd! BufRead,BufNewFile unbound.conf.j2        set noet sw=8 ts=8
>>>>>>> Stashed changes

  autocmd! BufRead,BufNewFile \(encrypted_\|private_\|empty_\|executable_\|dot_\)*netrc\(.tmpl\)* set ft=netrc
augroup END
