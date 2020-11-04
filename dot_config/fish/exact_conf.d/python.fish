which python3
set PATH (python3 -msite --user-base)/bin $PATH
set --export PYTHONPATH (python3 -msite --user-site)
echo $PYTHONPATH
