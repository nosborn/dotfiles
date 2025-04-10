scriptencoding utf-8

call ale#fix#registry#Add('alloy', 'ale#fixers#alloy#Fix', ['river'], 'Fix river files with alloy fmt')
call ale#fix#registry#Add('dockerfmt', 'ale#fixers#dockerfmt#Fix', ['dockerfile'], 'Fix Dockerfiles with dockerfmt')
