### Git Revision Specifications

```
SHA-1 or short SHA-1 (default first seven characters)
Branch name
RefLog shortnames, works for HEAD and branch names. 'git reflog' to see list or 'git reflog show master'
  HEAD@{5} fifth HEAD ago
  master@{yesterday}
  @{upstream} current branch origin
HEAD^ parent of HEAD
d921970^2 second parent of d921970, only useful for merges. does not mean grandparent
HEAD~ parent of HEAD (equivalent to HEAD^)
HEAD~2 grandparent of HEAD (equivalent to HEAD^^)
A..B commits in B that are not in A
A..  equivalent to A..HEAD (also ..B)
A...B commits in either but not both, often with --left-right
```

### Git

diff by word instead of line `git diff --color-words`

export a stash `git stash show -p > file.patch`

see what will be cleaned `git clean --dry-run`

#### Git bisect

* git bisect start
* git bisect good a1b54ff3
* git bisect bad master
  + git bisect bad
  + git bisect good
  + git bisect skip
* git bisect reset

### Git Svn

```
git svn clone <svn url> -s --prefix=origin/
git svn clone <svn url>/trunk --prefix=origin/ # clone without tags and branches
git svn fetch # gets new svn commits onto origin/git-svn, can continue a failed clone sometimes
...use git normally...
git svn rebase # pulls down, rebases current work on top, creates local commits. instead of pull
git svn dcommit
...if using topic branches, rebase them onto master instead of merging.
...don't push to git repos, since commits get rewritten when using dcommit
git svn find-rev r1234
```

### Tagging Releases

```
git tag;                              # to determine most recent existing version tag
git pull;                             # update develop
git checkout master;                  # switch to the master branch
git merge origin/master;              # [opt] update master if anything was pulled
git merge develop -m '';              # merge in the current develop branch
git tag -a v0.1.4 -m 'version 0.1.4'; # replace 0.1.4 with version number
git push;                             # push master
git push --tags;                      # push tags
git checkout develop;                 # remember to go back to develop branch
git log --oneline v0.1.3..v0.1.4 >> ~/log.txt; # print summary between versions
git show v1.0.1                       # show sha1 for the tag
```
