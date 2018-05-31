
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
