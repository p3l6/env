
git diff --color-words
git stash show -p > file.patch
git clean --dry-run
git bisect start; git bisect good a1b54ff3; git bisect bad master; .... git bisect bad/good/skip ...; git bisect reset; # find the commit that broke something
