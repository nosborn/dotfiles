#!/bin/sh

if [ $# -ne 1 ]; then
  printf 'Usage: sts [PROFILE]\n' >&2
  exit 1
fi

assume_role () {
  role_arn=$(aws --profile="$1" configure get role_arn) || return
  role_session_name=$(aws --profile="$1" configure get role_session_name || echo)

  env -u AWS_ACCESS_KEY_ID -u AWS_PROFILE -u AWS_SECRET_ACCESS_KEY -u AWS_SESSION_TOKEN \
    aws --output=json --profile="$1" sts assume-role \
      --role-arn "${role_arn}" \
      --role-session-name "${role_session_name:-$(id -u -n)-$(date +%s)}" || return

  unset role_arn role_session_name
}

role=$(assume_role "$1") || exit

printf 'export AWS_ACCESS_KEY_ID="%s"\n' "$(echo "${role}"|jq -r .Credentials.AccessKeyId)"
printf 'export AWS_EXPIRATION="%s"\n' "$(echo "${role}"|jq -r .Credentials.Expiration)"
printf 'export AWS_PROFILE="%s"\n' "$1"
printf 'export AWS_SECRET_ACCESS_KEY="%s"\n' "$(echo "${role}"|jq -r .Credentials.SecretAccessKey)"
printf 'export AWS_SESSION_TOKEN="%s"\n' "$(echo "${role}"|jq -e .Credentials.SessionToken)"
