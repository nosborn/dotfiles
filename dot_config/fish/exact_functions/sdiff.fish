function sdiff --wraps 'sdiff -d -w $COLUMNS' --description 'alias sdiff=command sdiff -d -w $COLUMNS'
    command sdiff -d -w $COLUMNS $argv
end
