git tag -d $1
git push origin :refs/tags/$1
git tag -a tonywip -m "$1"
git push --tags
