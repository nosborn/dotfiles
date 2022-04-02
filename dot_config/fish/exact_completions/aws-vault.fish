# usage: aws-vault [<flags>] <command> [<args> ...]

function __fish_aws_vault_complete_keychains
    find "$HOME/Library/Keychains" -name '*.keychain-db' -print0 |
        xargs -0 -I {} basename {} .keychain-db
end

function __fish_aws_vault_complete_profiles
    aws-vault list --profiles | sed 's/^"//;s/"$//'
end

# general options
complete -c aws-vault -l backend -xa 'keychain pass file' -d 'Secret backend to use'
complete -c aws-vault -l debug -f -d 'Show debugging output'
complete -c aws-vault -l file-dir -xa '(__fish_complete_directories)' -d 'Directory for the "file" password store'
complete -c aws-vault -l help -f -d 'Show context-sensitive help (also try --help-long and --help-man)'
complete -c aws-vault -l keychain -xa '(__fish_aws_vault_complete_keychains)' -d "Name of macOS keychain to use, if it doesn't exist it will be created"
# --pass-cmd=PASS-CMD
complete -c aws-vault -l pass-cmd -x -d 'Name of the pass executable'
complete -c aws-vault -l pass-dir -xa '(__fish_complete_directories)' -d 'Pass password store directory'
# --pass-prefix=PASS-PREFIX
complete -c aws-vault -l pass-prefix -x -d 'Prefix to prepend to the item path stored in pass'
complete -c aws-vault -l prompt -xa 'kdialog osascript pass terminal ykman zenity' -d 'Prompt driver to use'
# --secret-service-collection="awsvault"
complete -c aws-vault -l secret-service-collection -x -d "Name of secret-service collection to use, if it doesn't exist it will be created"
complete -c aws-vault -l version -f -d 'Show application version'

### add
complete -c aws-vault -n __fish_use_subcommand -a add -d 'Adds credentials to the secure keystore'
# usage: aws-vault add [<flags>] <profile>
complete -c aws-vault -n '__fish_seen_subcommand_from add' -l add-config -x -d "Add a profile to ~/.aws/config if one doesn't exist"
complete -c aws-vault -n '__fish_seen_subcommand_from add' -l env -x -d 'Read the credentials from the environment'

### clear
complete -c aws-vault -n __fish_use_subcommand -a clear -d 'Clear temporary credentials from the secure keystore'
# usage: aws-vault clear [<profile>]
complete -c aws-vault -n '__fish_seen_subcommand_from clear' -xa '(__fish_aws_vault_complete_profiles)' -d 'Name of the profile'

### exec
complete -c aws-vault -n __fish_use_subcommand -a exec -d 'Executes a command with AWS credentials in the environment'
# usage: aws-vault exec [<flags>] <profile> [<cmd>] [<args>...]
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -s d -l duration -x -d 'Duration of the temporary or assume-role session. Defaults to 1h'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -s j -l json -d 'Output credentials in JSON that can be used by credential_process'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -s n -l no-session -f -d 'Skip creating STS session with GetSessionToken'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -s s -l server -d 'Alias for --ec2-server. Run a EC2 metadata server in the background for credentials'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -s t -l mfa-token -x -d 'The MFA token to use'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -l ec2-server -d 'Run a EC2 metadata server in the background for credentials'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -l ecs-server -d 'Run a ECS credential server in the background for credentials'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -l region -xa 'ap-southeast-1 us-east-1' -d 'The AWS region'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -l stdout -d 'Print the SSO link to the terminal without automatically opening the browser'
complete -c aws-vault -n '__fish_seen_subcommand_from exec' -xa '(__fish_aws_vault_complete_profiles)' -d 'Name of the profile'

### help
complete -c aws-vault -n __fish_use_subcommand -a help -x -d 'Show help'

### list
complete -c aws-vault -n __fish_use_subcommand -a list -d 'List profiles, along with their credentials and sessions'
# usage: aws-vault list [<flags>]
complete -c aws-vault -n '__fish_seen_subcommand_from list' -l credentials -f -d 'Show only the profiles with stored credential'
complete -c aws-vault -n '__fish_seen_subcommand_from list' -l profiles -f -d 'Show only the profile names'
complete -c aws-vault -n '__fish_seen_subcommand_from list' -l sessions -f -d 'Show only the session names'

### login
complete -c aws-vault -n __fish_use_subcommand -a login -d 'Generate a login link for the AWS Console'
# usage: aws-vault login [<flags>] <profile>
complete -c aws-vault -n '__fish_seen_subcommand_from login' -s d -l duration -x -d 'Duration of the temporary or assume-role session. Defaults to 1h'
complete -c aws-vault -n '__fish_seen_subcommand_from login' -s n -l no-session -f -d 'Skip creating STS session with GetSessionToken'
complete -c aws-vault -n '__fish_seen_subcommand_from login' -s s -l stdout -d 'Print login URL to stdout instead of opening in default browser'
complete -c aws-vault -n '__fish_seen_subcommand_from login' -s t -l mfa-token -x -d 'The MFA token to use'
complete -c aws-vault -n '__fish_seen_subcommand_from login' -l path -x -d 'The AWS service you would like access'
complete -c aws-vault -n '__fish_seen_subcommand_from login' -l region -xa 'ap-southeast-1 us-east-1' -d 'The AWS region'
complete -c aws-vault -n '__fish_seen_subcommand_from login' -xa '(__fish_aws_vault_complete_profiles)' -d 'Name of the profile'

### remove
complete -c aws-vault -n __fish_use_subcommand -a remove -d 'Removes credentials from the secure keystore'
# usage: aws-vault remove [<flags>] <profile>
complete -c aws-vault -n '__fish_seen_subcommand_from remove' -s f -l force -f -d 'Force-remove the profile without a prompt'
complete -c aws-vault -n '__fish_seen_subcommand_from remove' -xa '(__fish_aws_vault_complete_profiles)' -d 'Name of the profile'

### rotate
complete -c aws-vault -n __fish_use_subcommand -a rotate -d 'Rotates credentials'
# usage: aws-vault rotate [<flags>] <profile>
complete -c aws-vault -n '__fish_seen_subcommand_from rotate' -s n -l no-session -f -d 'Use master credentials, no session or role used'
complete -c aws-vault -n '__fish_seen_subcommand_from rotate' -xa '(__fish_aws_vault_complete_profiles)' -d 'Name of the profile'
