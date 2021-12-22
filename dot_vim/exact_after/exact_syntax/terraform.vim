" FIXME: why doesn't this work properly with <<-EOT ?
"syntax region terraHereDocText start=/<<-\?\z([a-z0-9A-Z]\+\)/ end=/^\s*\z1/ contains=terraStringInterp
