function tfdiff --wraps diff
    command diff \
        --exclude='*.bak' \
        --exclude='*.tfplan' \
        --exclude='*.tfstate' \
        --exclude='*.tfstate.*' \
        --exclude=.terraform \
        --exclude=.terraform.lock.hcl \
        --exclude=PLAN \
        --minimal \
        --new-file \
        --recursive \
        --side-by-side \
        --width=$COLUMNS \
        $argv
end
