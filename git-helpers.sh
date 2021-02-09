## Git checkout save local, temporary commits 
gcl() { 
    echo "### Adding any wip files";
    git add .; 
    echo "### Committing files with a temporary commit";
    git commit --no-verify -am 'local commit - work in progress';
    echo "### Checking out branch";
    git checkout "$1";
    x="$(git log -1 --pretty=%B)"
    if [ "$x" = "local commit - work in progress" ]; then
        echo "### Undoing last commit";
        git reset --soft HEAD^
    else 
        echo "### Not undoing last commit"
    fi
    echo "gcl complete"
}