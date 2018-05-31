
git svn clone <svn url> -s --prefix=origin/
git svn clone <svn url>/trunk --prefix=origin/ # clone without tags and branches
git svn fetch # gets new svn commits onto origin/git-svn, can continue a failed clone sometimes
...use git normally...
git svn rebase # pulls down, rebases current work on top, creates local commits. instead of pull
git svn dcommit
...if using topic branches, rebase them onto master instead of merging.
...don't push to git repos, since commits get rewritten when using dcommit
git svn find-rev r1234
