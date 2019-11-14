if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.Jenkinsfile                 set ft=groovy
  au! BufRead,BufNewFile *.ini.erb                     set ft=dosini.eruby
  au! BufRead,BufNewFile *.json.erb                    set ft=json.eruby
  au! BufRead,BufNewFile *.json.j2                     set ft=json.jinja2
  au! BufRead,BufNewFile *.lua.erb                     set ft=lua.eruby
  au! BufRead,BufNewFile *.lua.j2                      set ft=lua.jinja2
  au! BufRead,BufNewFile *.pl.erb                      set ft=perl.eruby
  au! BufRead,BufNewFile *.pl.j2                       set ft=perl.jinja2
  au! BufRead,BufNewFile *.properties.erb              set ft=jproperties.eruby
  au! BufRead,BufNewFile *.properties.j2               set ft=jproperties.jinja2
  au! BufRead,BufNewFile *.py.erb                      set ft=python.eruby
  au! BufRead,BufNewFile *.py.j2                       set ft=python.jinja2
  au! BufRead,BufNewFile *.sh.erb                      set ft=sh.eruby
" au! BufRead,BufNewFile *.sh.j2                       set ft=sh.jinja2
  au! BufRead,BufNewFile *.toml.tmpl                   set ft=toml
" au! BufRead,BufNewFile *.{yaml,yml}.j2               set ft=yaml.jinja2
" au! BufRead,BufNewFile */ansible{,-*}/**/tasks/*.yml set ft=ansible
" au! BufRead,BufNewFile */ansible{,-*}/*.yml          set ft=ansible
  au! BufRead,BufNewFile */terraform/**/*.rules        set ft=markdown.pandoc
  au! BufRead,BufNewFile *_Jenkinsfile                 set ft=groovy
  au! BufRead,BufNewFile .babelrc                      set ft=json
  au! BufRead,BufNewFile .markdownlintrc               set ft=json
  au! BufRead,BufNewFile .yamllint                     set ft=yaml
  au! BufRead,BufNewFile Brewfile                      set ft=ruby
  au! BufRead,BufNewFile Jenkinsfile                   set ft=groovy
  au! BufRead,BufNewFile Vagrantfile                   set ft=ruby
  au! BufRead,BufNewFile acme-client.conf.j2           set sw=8 ts=8
  au! BufRead,BufNewFile bash_profile.j2               set ft=sh.jinja2
  au! BufRead,BufNewFile bashrc.j2                     set ft=sh.jinja2
  au! BufRead,BufNewFile core_config.php.j2            set ft=php.jinja2 noet sw=8 ts=8
  au! BufRead,BufNewFile dhcpd.conf.j2                 set noet sw=8 ts=8
" au! BufRead,BufNewFile direnvrc                      set ft=sh
  au! BufRead,BufNewFile dot_bash_profile              set ft=sh
  au! BufRead,BufNewFile dot_bashrc                    set ft=sh
  au! BufRead,BufNewFile gemrc.j2                      set ft=yaml.jinja2
  au! BufRead,BufNewFile interfaces.j2                 set noet sw=8 ts=8
  au! BufRead,BufNewFile liquidpromptrc.j2             set ft=sh.jinja2
  au! BufRead,BufNewFile nftables.conf.j2              set noet sw=8 ts=8
  au! BufRead,BufNewFile nsd.conf.j2                   set noet sw=8 ts=8
  au! BufRead,BufNewFile rad.conf.j2                   set noet sw=8 ts=8
  au! BufRead,BufNewFile unbound.conf.j2               set noet sw=8 ts=8

  au! BufRead,BufNewFile \(encrypted_\|private_\|empty_\|executable_\|dot_\)*netrc\(.tmpl\)* set ft=netrc
augroup END
