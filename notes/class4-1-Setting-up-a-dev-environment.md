# Setting Up a Dev Environment

In this phase of the class, we'll be graduating from an environment where we are playing with Ruby to one in which we'll work as professional developer.

Warning ... contains *OPINIONS*!

## What are the components that make up a development environment?

A development environment is the set of programs, libraries, applications, and other tools that are required to build an application.

1. Command line shell and configuration
2. Package management for dependencies
3. Ruby version selection and environment
4. Ruby library handling
5. Version control system
6. Source code editor or IDE
7. Database or databases
8. Local application server for web app and services that we'll build

This is the general set of things that are meant when we talk about a development environment. I'll talk about each category in turn and include some alternatives that are available then talk about the particular choice that I've selected for this class.

## Step Zero - What about a VM?

One thing I didn't include on the list was building up a development environment using a VM image. This is a valid approach for many users, particularly those using Windows as a desktop OS.

Outside of Visual Studio and (possibly) Eclipse for Java development, Windows is a weak OS to develop software.

## Command Line Shell

First of all we'll need a command line shell. This may seem strange to those coming from a Windows environment, but with the exception of Microsoft, all other programming languages make use of the power of command line shells to work.

*Real Programmers Use the Command Line*

### On Linux or OS X

On Linux or OS X you will get a shell which is usually [Bash](https://www.gnu.org/software/bash/manual/bashref.html) by default.

I'm a big fan of [Zsh](http://zsh.sourceforge.net/) as an alternative to Bash. There will be nothing in this class that is dependent on Zsh (but try it out if you're curious).

### On Windows

Here's where we run into the first issue for Windows developers. The default shell on Windows (cmd.exe) is an exceptionally weak shell for programmers.

There are a few alternatives available:

1. [Powershell](http://www.microsoft.com/powershell): This is a better shell in just about every way though IMHO it requires quite a bit of customization before it becomes really usable. This is Microsoft's choice for a better shell.
2. [GOW](https://github.com/bmatzelle/gow) (Gnu on Windows) is a lightweight collection of GNU command line utilities that (while I haven't tried it myself) seems like a reasonable basic set of command line tools that you can use.
3. Git Bash - ***TBD***
3. [MingW](http://mingw.org/) Is a development environment that brings the GNU utilities and command shell to Windows
4. [Cygwin](http://cygwin.com/): Back when I was a Windows developer, I always used cygwin to provide Unix-like GNU commands. It still is available, but the commands have trouble interacting with some windows applications (that aren't compiled with cygwin's posix layer). As a result, I don't recommend it anymore unless you are already using it.

## Package Management

Many of the dependencies that you'll be using will be dependent on or applications that you can install with your system's package management system.

### OS X

The best package manager for OS X is [Homebrew](http://brew.sh/)

Older alternatives (that I don't recommend) are Fink and Macports.

### Linux

Use the package manager used by your Linux distro. Common ones are dpkg, rpm, yum, apt.

### Windows

On windows, the Windows Installer sort of provides this functionality, but more often in Windows you are faced with locating the installers for dependencies yourself.

## Ruby Version Selection

You have the choice of running multiple versions and implementations of Ruby. In addition to the standard Ruby implementations (MRI, JRuby, IronRuby, Rubinious, and others), there are specific versions of each of those implementations. It is usually worthwhile to be able to select a different version of Ruby for different projects for example, you may use the latest version of MRI for your personal projects, but you may need to simultaneuosly work on a legacy project that is running in production on version 1.9.3.

### Linux and OS X

There are several options for Linux and OS X:

* [rbenv](https://github.com/sstephenson/rbenv)
* [rvm](http://rvm.io/)
* [chruby](https://github.com/postmodern/chruby)

I recommend rbenv with [ruby-build](https://github.com/sstephenson/ruby-build) to build the ruby versions.

### Windows

[Pik](https://github.com/vertiginous/pik) provides a means to switch rubies that works for Cmd (cmd.exe), Windows PowerShell, or Git Bash.

Here's a Pik Tutorial: [Ruby Version Manager for Windows](http://www.ruby-on-rails-outsourcing.com/articles/2010/07/28/ruby-version-manager-for-windows/)

## Ruby Library Handling

Ruby libraries are called Gems. Historically, gemsets have been handled in different ways by projects. Currently, projects almost unanimously use [Bundler](http://bundler.io/) to manage gem and version dependencies for projects.

Bundler works by including dependencies in a file at the top of your Ruby project named Gemfile.

## Version Control

When you are working on a ruby project you need to save your source code. Version control systems give you the ability to save your work, collaborate with others, see changes over time (useful to see where a bug crept in), and a lot more.

There are dozens of both open source and commercial version control systems. Git, Subversion, Mercurial, Bazaar, CVS, are a few of the most popular open source ones.

I recommend [Git](http://git-scm.com/). Git is free and has a lot of killer features. It's extremely powerful (though sometimes a challenge to learn). Github.com is a product built on Git that provides a nice web application interface to Git projects that makes collaboration a LOT easier. Get a free Github account to work through this class.

You need to install the git command line tools using your package manager. Alternately, you can install git directly from [Git](http://git-scm.com/).

## Source Code Editor or IDE

Unlike languages like Java or C#, most Ruby developers use a programmer's text editor instead of a full blown IDE.

The most popular text editors for Ruby programmers are:

* [Sublime Text](sublimetext.com) - commercial
* [Textmate](http://www.macromates.com/) - commercial
* [Atom](http://atom.io/) - free open source
* [Emacs](https://www.gnu.org/software/emacs/) - free open source
* [Vim](http://www.vim.org/) - free open source

There are a couple of Ruby IDEs. In general, I don't recommend them, but Jet Brains' [RubyMine](http://www.jetbrains.com/ruby/features/ruby_ide.html) is pretty nice.

I recommend that you use Sublime Text, Textmate, or Atom. If you are already comfortable with Emacs or Vim, then feel free to use those instead.

## Database

There are many, many databases available. In addition to the many relational databases that have been used for years, there are many non-relational databases (called NoSQL) databases that have become popular in recent years.

For the purposes of this class, we are going to use [PostgreSQL](https://www.postgresql.org/) which is a relational database that is free to use.

It can be installed via your package management software or directly from the site.

## Local Appliction Server

When working on a web application, it's helpful often to run the web app in an environment very similar to what it will be run in production.

You can get as elaborate here as you'd like regarding how much convenience you want versus how close to production you want to be.

### OS X

On OS X, a convenient tool to use is [Pow](http://pow.cx/).

### Linux

On Linux, you can configure and Apache or Nginx instance that directs requests to your Ruby project. Doing this is outside of the scope of this tutorial, but we'll touch on this when we talk about configuring a Ruby application in a production environment.

### Windows

This remains to be determined. You can install an Apache instance and connect it to your application similar to the way you would on a Linux machine.

### General

If you want a simpler environment (bypassing Apache or Nginx), you will want to run your app through a ruby web server like Thin, Unicorn, or Passenger.

I recommend that you use [Thin](http://code.macournoyer.com/thin/). You can install this by including Thin as a dependency in your application's Bundler Gemfile.
