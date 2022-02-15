# Usage:
#   act [event name to run]
# If no event name passed, will default to "on: push" [flags]

complete -c act -s a -l actor -x -d 'user that triggered the event'
complete -c act -l artifact-server-path -r -d 'path where the artifact server stores uploads and retrieves downloads from'
complete -c act -l artifact-server-port -x -d 'port where the artifact server listens'
complete -c act -s b -l bind -f -f 'bind working directory to container, rather than copy'
complete -c act -l container-architecture -x -d 'Architecture which should be used to run containers'
complete -c act -l container-cap-add -x 'kernel capabilities to add to the workflow containers'
complete -c act -l container-cap-drop -x 'kernel capabilities to remove from the workflow containers'
complete -c act -l container-daemon-socket -r 'Path to Docker daemon socket which will be mounted to containers'
complete -c act -l defaultbranch -x -d 'the name of the main branch'
complete -c act -l detect-event -f -d 'Use first event type from workflow as event that triggered the workflow'
complete -c act -s C -l directory -r -d 'working directory'
complete -c act -s n -l dryrun -f -d 'dryrun mode'
complete -c act -l env -x -d 'env to make available to actions with optional value'
complete -c act -l env-file -r -d 'environment file to read and use as env in the containers'
complete -c act -s e -l eventpath -r -d 'path to event JSON file'
complete -c act -l github-instance -r -d 'GitHub instance to use'
complete -c act -s g -l graph -f -d 'draw workflows'
complete -c act -s h -l help -f -d 'help for act'
complete -c act -l insecure-secrets -f -d "Don't hide secrets while printing logs"
complete -c act -s j -l job -x -d 'run job'
complete -c act -s l -l list -f -d 'list workflows'
complete -c act -l no-recurse -f -d 'disable running workflows from subdirectories of specified path'
complete -c act -s P -l platform -x -d 'custom image to use per platform'
complete -c act -l privileged -f -d 'use privileged mode'
complete -c act -s p -l pull -f -d 'pull docker image(s) even if already present'
complete -c act -s q -l quiet -f -d 'disable logging of output from steps'
complete -c act -l rebuild -f -d 'rebuild local action docker image(s) even if already present'
complete -c act -s r -l reuse -f -d 'reuse action containers to maintain state'
complete -c act -l rm -f -d 'automatically remove containers just before exit'
complete -c act -s s -l secret -f -d 'secret to make available to actions with optional value'
complete -c act -l secret-file -r -d 'file with list of secrets to read from'
complete -c act -l use-gitignore -f -d 'paths specified in .gitignore should be copied into container'
complete -c act -l userns -x -d 'user namespace to use'
complete -c act -s v -l verbose -f -d 'verbose output'
complete -c act -l version -f -d 'version for act'
complete -c act -s w -l watch -f -d 'watch the contents of the local repo and run when files change'
complete -c act -s W -l workflows -r -d 'path to workflow file(s)'
