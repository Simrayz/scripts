# Gets the version number from the current directory.
function version() {
    MIX_FILE=./mix.exs
    NPM_FILE=./package.json
    if test -f "$MIX_FILE"; then
        cat mix.exs | grep version | sed -e 's/.*version: "\(.*\)",/\1/'
    elif test -f "$NPM_FILE"; then
        awk -F'"' '/"version": ".+"/{ print $4; exit; }' $NPM_FILE
    else
        echo "No version file found. Only NPM and Mix projects are supported."
    fi
}
