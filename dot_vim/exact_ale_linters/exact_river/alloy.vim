call ale#Set('river_alloy_executable', 'alloy')

call ale#linter#Define('river', {
      \   'name': 'alloy',
      \   'executable': {b -> ale#Var(b, 'river_alloy_executable')},
      \   'command': function('ale#handlers#alloy#GetCommand'),
      \   'callback': 'ale#handlers#alloy#Handle',
      \ })
