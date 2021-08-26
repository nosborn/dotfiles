set --global --export PYTHONDONTWRITEBYTECODE 1
set --global --export PYTHONWARNINGS ignore

fish_add_path --path (python3 -msite --user-base)
