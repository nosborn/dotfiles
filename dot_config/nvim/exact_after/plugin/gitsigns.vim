lua <<EOT
require('gitsigns').setup()
EOT

nmap ]c <Plug>(Gitsigns next_hunk)
nmap [c <Plug>(Gitsigns prev_hunk)
