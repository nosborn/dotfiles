# These are very much incomplete completions for the aws-cli suite.
# In addition to a complete list of services, the `aws s3` completions are mostly complete
# (and are the primary reason this file exists). The automatically generated completions
# for `aws` via `fish_update_completions` are pretty useless due to non-standard formatting.

function __s3_is_maybe_bucket
    commandline -ct | string match -qr -- '^(|s|s3|s3:?/?/?[^/]*)$'
end

function __s3_is_bucket
    commandline -ct | string match -q -r -- '^s3:/?/?[^/]*$'
end

function __s3_is_remote_path
    commandline -ct | string match -q -r -- "^s3://.+/.*"
end

function __s3_ls_buckets
    aws s3 ls | string replace -rf '.* (\S+)$' 's3://$1/'
end

function __s3_ls_dir
    set -l dir (commandline -ct | string replace -rf '(s3://.*/).*' '$1')
    printf "$dir%s\n" (aws s3 ls $dir 2>/dev/null | string replace -fr '^(:?\S+ +\S+ +\S+ |^.*PRE )(.*)' '$2')
end

# Determines whether the first non-switch argument to `aws s3` was in $argv
# This accounts for things like `aws --debug s3 foo ... s3://...`
function __s3_cmd_in
    set -l is_s3 0
    set -l tokens (commandline -co)
    for token in $tokens[2..-1]
        # Ignore switches everywhere
        if string match -qr -- "^--" $token
            continue
        end

        # Check if `aws` command is `s3`
        if test $is_s3 -eq 0
            if string match -q -- "s3" $token
                set is_s3 1
                continue
            else
                return 1
            end
        end

        # Check if `aws s3` sub-sub-command is in $argv
        if contains $token $argv
            return 0
        else
            return 1
        end
    end

    return 1
end

# Determines whether the first non-switch argument to `aws` was in $argv
function __aws_cmd_in
    set -l tokens (commandline -co)
    for token in $tokens[2..-1]
        if string match -qr "^--" -- $token
            # Ignore switches everywhere
            continue
        else if contains $token $argv
            return 0
        else
            return 1
        end
    end

    return 1
end

function __az_commands
  az | awk '$2==":" {print $1}'
end

# S3 completions
complete -c 'az' -n "__fish_prev_arg_in s3" -xa "cp mv rm help sync ls mb mv presign rb website"

# When completing a remote path, complete the bucket name first, then based off
# the bucket name, we can complete the path itself.

# Commands that take only remote parameters (cannot operate on local files).
complete -c 'az' -n "__s3_is_maybe_bucket && __s3_cmd_in ls rb rm" -xa "(__s3_ls_buckets)"
# Commands that can operate on local or remote files. To prevent the shell
# locking up unnecessarily, only complete if no argument was specified or if the
# argument being specified could be an S3 path.
complete -c 'az' -n "__s3_is_maybe_bucket && __s3_cmd_in mv cp presign mb sync" -a "(__s3_ls_buckets)"

# Complete the paths themselves
complete -c 'az' -n "__s3_is_remote_path" -xa "(__s3_ls_dir)"
complete -c 'az' -n "__s3_is_bucket" -xa "(__s3_ls_buckets)"

function __fish_az_complete
  set -x COMP_LINE (commandline -p)
  set -x COMP_POINT (string length (commandline -cp))
  set -x COMP_TYPE
  set -x _ARGCOMPLETE 1
  set -x _ARGCOMPLETE_DFS \t
  set -x _ARGCOMPLETE_IFS \n
  set -x _ARGCOMPLETE_SHELL fish
  set -x _ARGCOMPLETE_SUPPRESS_SPACE 1
  if set -q _ARC_DEBUG
    az 8>&1 9>&2 1>/dev/null 2>&1
  else
    az 8>&1 9>&2 1>&9 2>&1
  end
end

complete -c az -f -a '(__fish_az_complete)'
