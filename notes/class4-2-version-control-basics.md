git add --all  or  -A
git add .

git bisect bad
git bisect good
git bisect reset
git bisect start

git branch --merged
git branch -r --no-merged

git branch --set-upstream --track -f development
git branch --unset-upstream --track -f master

git branch -d -r origin/correct-status-code-docs (delete remote branch)
git branch -d add-app-versioning  (delete only merged branched)
git branch -D asset_fixes (delete branch merged or not)
git branch -r --merged (remote merged branched)

git checkout --track -b gh-pages origin/gh-pages
git checkout -b add_slug_to_item
git checkout app/controllers/api/v1/api_controller.rb
git checkout master

git cherry-pick cd780d9

git clone git://git.code.sf.net/p/sloccount/code sloccount-code
git clone https://git.code.sf.net/p/sloccount/code sloccount-code

git commit -m "a few minor changes"
git commit --amend
git commit --amend --author="Mark Morga <markmorga@gmail.com>"

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

git describe --tags

git diff
git diff .gitignore

git fetch john6150

git filter-branch --index-filter 'git rm --cached --ignore-unmatch slides.yml' 320218..HEAD
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch slides.yml' 320218..HEAD

git gc

git global

git help

git info

git init .

git log
git log --pretty=format:"%h %s" HEAD~3..HEAD

git ls-files | while read i; do git blame $i | sed -e 's/^[^(]*(//' -e 's/^\([^[:digit:]]*\)[[:space:]]\+[[:digit:]].*/\1/'; done | sort | uniq -ic | sort -nr

git merge --abort
git merge day1
git mergetool

git mv README.md README.rdoc

git prune
git prune origin

git pull
git pull master
git pull origin master

git push
git push --all
git push --set-upstream origin master
git push -u origin master

git push upstream :rails4

git push upstream master
git push upstream master --tags

git rebase --abort
git rebase --continue
git rebase -i master
git rebase master
git rebase upstream master

git remote
git remote -v
git remote add upstream https://github.rackspace.com/GSCS/product_catalog.git
git remote prune -n origin flash
git remote remove john6150
git remote rename origin upstream

git reset HEAD

git revert dummy.*

git rm -f README
git rm -r config
git rm README

git settings

git shortlog -s -n 4513fe0..HEAD

git show v1.0.1-rc1

git stash
git stash apply
git stash show

git status

git tag "0.0.1"
git tag -a v0.1.1 -m "Fixed status codes and added rubocop suggestions"
git tag -a v1.0.1-rc1 -m "Release candidate for Monday release"
