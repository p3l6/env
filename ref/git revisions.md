
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
