# GLOBAL OPTIONS
complete -c sops -s a -l age -x -d 'value comma separated list of age recipients'
complete -c sops -s d -l decrypt -d 'decrypt a file and output the result to stdout'
complete -c sops -s e -l encrypt -d 'encrypt a file and output the result to stdout'
complete -c sops -s h -l help -f -d 'show help'
complete -c sops -s i -l in-place -f -d 'write output back to the same file instead of stdout'
complete -c sops -s k -l kms -x -d 'value comma separated list of KMS ARNs'
complete -c sops -s p -l pgp -x -d 'comma separated list of PGP fingerprints'
complete -c sops -s r -l rotate -f -d 'generate a new data encryption key and reencrypt all values with the new key'
complete -c sops -s s -l show-master-keys -f -d 'display master encryption keys in the file during editing'
complete -c sops -s v -l version -f -d 'print the version'
complete -c sops -l add-age -x -d 'add the provided comma-separated list of age recipients fingerprints to the list of master keys on the given file'
complete -c sops -l add-azure-kv -x -d 'add the provided comma-separated list of Azure Key Vault key URLs to the list of master keys on the given file'
complete -c sops -l add-gcp-kms -x -d 'add the provided comma-separated list of GCP KMS key resource IDs to the list of master keys on the given file'
complete -c sops -l add-hc-vault-transit -x -d "add the provided comma-separated list of Vault's URI key to the list of master keys on the given file"
complete -c sops -l add-kms -x -d 'add the provided comma-separated list of KMS ARNs to the list of master keys on the given file'
complete -c sops -l add-pgp -x -d 'value add the provided comma-separated list of PGP fingerprints to the list of master keys on the given file'
complete -c sops -l aws-profile -x -d 'The AWS profile to use for requests to AWS'
complete -c sops -l azure-kv -x -d 'comma separated list of Azure Key Vault URLs'
complete -c sops -l config -r -d "path to sops' config file"
complete -c sops -l enable-local-keyservice -f -d 'use local key service'
complete -c sops -l encrypted-regex -x -d 'set the encrypted key suffix'
complete -c sops -l encrypted-suffix -x -d 'override the encrypted key suffix'
complete -c sops -l encryption-context -x -d 'comma separated list of KMS encryption context key:value pairs'
complete -c sops -l extract -x -d 'extract a specific key or branch from the input document'
complete -c sops -l gcp-kms -x -d 'comma separated list of GCP KMS resource IDs'
complete -c sops -l hc-vault-transit -x -d "comma separated list of vault's key URI"
complete -c sops -l ignore-mac -f -d 'ignore Message Authentication Code during decryption'
complete -c sops -l input-type -xa 'json yaml dotenv binary' -d 'the input type'
complete -c sops -l keyservice -x -d 'Specify the key services to use in addition to the local one'
complete -c sops -l output -r -d 'Save the output after encryption or decryption to the file specified'
complete -c sops -l output-type -xa 'json yaml dotenv binary' -d 'the output type'
complete -c sops -l rm-age -x -d 'remove the provided comma-separated list of age recipients from the list of master keys on the given file'
complete -c sops -l rm-azure-kv -x -d 'remove the provided comma-separated list of Azure Key Vault key URLs from the list of master keys on the given file'
complete -c sops -l rm-gcp-kms -x -d 'remove the provided comma-separated list of GCP KMS key resource IDs from the list of master keys on the given file'
complete -c sops -l rm-hc-vault-transit -x -d "remove the provided comma-separated list of Vault's URI key from the list of master keys on the given file"
complete -c sops -l rm-kms -x -d 'remove the provided comma-separated list of KMS ARNs from the list of master keys on the given file'
complete -c sops -l rm-pgp -x -d 'remove the provided comma-separated list of PGP fingerprints from the list of master keys on the given file'
complete -c sops -l set -x -d 'set a specific key or branch in the input document'
complete -c sops -l shamir-secret-sharing-threshold -x -d 'the number of master keys required to retrieve the data key with shamir'
complete -c sops -l unencrypted-regex -x -d 'set the unencrypted key suffix'
complete -c sops -l unencrypted-suffix -x -d 'override the unencrypted key suffix'
complete -c sops -l verbose -f -d 'Enable verbose logging output'

### exec-env
complete -c sops -n __fish_use_subcommand -a exec-env -d 'execute a command with decrypted values inserted into the environment'
# sops exec-env [command options] [file to decrypt] [command to run]
complete -c sops -n '__fish_seen_subcommand_from exec-env' -l background -f -d "background the process and don't wait for it to complete"
complete -c sops -n '__fish_seen_subcommand_from exec-env' -l enable-local-keyservice -f -d 'use local key service'
complete -c sops -n '__fish_seen_subcommand_from exec-env' -l keyservice -x -d 'Specify the key services to use in addition to the local one'
complete -c sops -n '__fish_seen_subcommand_from exec-env' -l user -f -d 'the user to run the command as'

### exec-file
complete -c sops -n __fish_use_subcommand -a exec-file -d 'execute a command with the decrypted contents as a temporary file'
# sops exec-file [command options] [file to decrypt] [command to run]
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l background -f -d "background the process and don't wait for it to complete"
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l enable-local-keyservice -f -d 'use local key service'
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l filename -r -d 'filename for the temporarily file'
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l keyservice -x -d 'Specify the key services to use in addition to the local one'
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l input-type -xa 'json yaml dotenv binary' -d 'the input type'
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l no-fifo -f -d 'use a regular file instead of a fifo to temporarily hold the decrypted contents'
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l output-type -xa 'json yaml dotenv binary' -d 'the output type'
complete -c sops -n '__fish_seen_subcommand_from exec-file' -l user -f -d 'the user to run the command as'

### groups
complete -c sops -n __fish_use_subcommand -a groups -d 'modify the groups on a SOPS file'
# sops groups [arguments...]

### help
complete -c sops -n __fish_use_subcommand -a help -f -d 'Shows a list of commands or help for one command'
complete -c sops -n '__fish_seen_subcommand_from help' -xa 'exec-env exec-file groups help keyservice publish updatekeys'

### keyservice
complete -c sops -n __fish_use_subcommand -a keyservice -d 'start a SOPS key service server'
# sops keyservice [command options] [arguments...]
complete -c sops -n '__fish_seen_subcommand_from keyservice' -l address -x -d 'address to listen on'
complete -c sops -n '__fish_seen_subcommand_from keyservice' -l network -xa 'tcp unix' -d 'network to listen on'
complete -c sops -n '__fish_seen_subcommand_from keyservice' -l prompt -f -d 'Prompt user to confirm every incoming request'
complete -c sops -n '__fish_seen_subcommand_from keyservice' -l verbose -f -d 'Enable verbose logging output'

### publish
complete -c sops -n __fish_use_subcommand -a publish -d 'Publish sops file or directory to a configured destination'
# sops publish [command options] file
complete -c sops -n '__fish_seen_subcommand_from publish' -s y -l yes -f -d 'pre-approve all changes and run non-interactively'
complete -c sops -n '__fish_seen_subcommand_from publish' -l enable-local-keyservice -f -d 'use local key service'
complete -c sops -n '__fish_seen_subcommand_from publish' -l keyservice -x -d 'Specify the key services to use in addition to the local one'
complete -c sops -n '__fish_seen_subcommand_from publish' -l omit-extensions -f -d 'Omit file extensions in destination path when publishing sops file to configured destinations'
complete -c sops -n '__fish_seen_subcommand_from publish' -l recursive -f -d 'If the source path is a directory, publish all its content recursively'
complete -c sops -n '__fish_seen_subcommand_from publish' -l verbose -f -d 'Enable verbose logging output'

### updatekeys
complete -c sops -n __fish_use_subcommand -a updatekeys -d 'update the keys of a SOPS file using the config file'
# sops updatekeys [command options] file
complete -c sops -n '__fish_seen_subcommand_from updatekeys' -s y -l yes -f -d 'pre-approve all changes and run non-interactively'
complete -c sops -n '__fish_seen_subcommand_from updatekeys' -l enable-local-keyservice -f -d 'use local key service'
complete -c sops -n '__fish_seen_subcommand_from updatekeys' -l keyservice -x -d 'Specify the key services to use in addition to the local one'
