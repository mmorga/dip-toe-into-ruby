# Dip Your Toe into Ruby

This repo contains an informal class on Ruby with the goal of minimally building out a small application/web service.

This will be an intro to ruby programming class. I’ll be starting from scratch so it should be doable even without previous programming experience. I’m going to free-flow it so we can figure out the right tempo for moving forward. If enough of you like it, I'll be happy to continue it on a scheduled basis.

## What to bring to class

Bring a laptop with ruby and rails installed and a text editor of your choice. I recommend: [Sublime Text 3](http://www.sublimetext.com/3).

### Ruby

You’ll need to have a [Ruby](https://www.ruby-lang.org/en/) version 1.9.3 (or newer) or a version 2.1 or newer.

* Mac users already have Ruby installed, but I can help you update to the latest and greatest if you'd like before class.
* Linux users are likely to have a ruby installed, otherwise it’s a simple process from your system package manager.
* Windows users will have the easiest time installing Ruby from here: http://rubyinstaller.org/downloads/

### Git

You should also have [git](http://www.git-scm.com/) installed and you should have an account on [Github](https://github.com/) since we’ll be playing like real developers.

## About this Repository

The master branch contains an initial Gemfile that can be used to prep a student's machine with the gems that will be used in the class.

Prior to class, you can install all of the gems we will be using by doing the following:

Clone this repository (needed only once)

```sh
git clone https://github.com/mmorga/dip-toe-into-ruby.git
```

Go into the project directory (`dip-toe-into-ruby` by default). Update your local copy to ensure you have the latest changes.

```sh
git pull origin master
```

Install required gems:

```sh
gem install bundler
bundle install
```

Contact me if you need help getting things working or want to verify your setup prior to the class.

## Acknowledgements

The following pages and resources were used to put together the class notes.

1. [Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
