# GitHub Processes

GitHub operations are used for Creating a new repo (on GitHub), forking an existing repo, sending pull requests, and accepting pull requests.

# Git Processes

## Create a new local repo

```sh
git init .
git remote add origin https://github.com/mmorga/wildthing.git
```

## Clone a remote repository

```sh
git clone https://github.com/mmorga/wildthing.git
```

This sets up a remote repo name for your space with the name "origin". If you are collaborating on a project, you should add a remote with the repo url of the main project with the name "upstream".

```sh
git remote add upstream https://github.com/getit/wildthing.git
```

## Creating a feature branch

```sh
git co -b new-feature-name
```

### Commiting changes

First stage them to be added.

```sh
git add somefile.rb
git rm somefileidontneedanymore.rb
git mv sometime.rb to-a-new/place.rb
```

or

```sh
git add --all
```

Then commit the change.

```sh
git commit -m "Always use a meaningful message"
```

## Pushing Changes

Push your branch to your fork of the project on GitHub:

```sh
git push origin new-feature-name
```

## Merging branch to your local master

(If you aren't collaborating on a larger project)

```sh
git co master
git merge new-feature-name
git push origin master
```

## Deleting a branch

```sh
git branch -d new-feature-name
```

Deleting a branch from your GitHub account

```
git push origin :new-feature-name
```

## Getting the latest changes from the project

```sh
git co master
git pull upstream master
git push origin master
```

## Where am I now?

```sh
git status
```

# Advanced Operations

## Git Bisect

git bisect bad
git bisect good
git bisect reset
git bisect start

## Cherry Picking Changes

git cherry-pick cd780d9

## Rebasing Branches

git rebase --abort
git rebase --continue
git rebase -i master
git rebase master
git rebase upstream master

## Stashing Changes

git stash
git stash apply
git stash show

## Tagging

git tag "0.0.1"
git tag -a v0.1.1 -m "Fixed status codes and added rubocop suggestions"
git tag -a v1.0.1-rc1 -m "Release candidate for Monday release"
