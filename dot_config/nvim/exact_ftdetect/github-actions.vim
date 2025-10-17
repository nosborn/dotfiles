augroup ftdetect_ghaction
  autocmd!
  autocmd BufRead,BufNewFile */.github*/workflows/*.yml,*/.github*/workflows/*.yaml setfiletype yaml.ghaction
augroup END
