Kyle Lacy's Dotfiles
====================
These are my dotfiles; pretty standard stuff. This setup of dotfiles is based on [the Sursolid article](http://sursolid.com/managing-home-dotfiles-with-git-and-github) (which, in turn, was based on [Sila Swell's setup](http://www.silassewell.com/blog/2009/03/08/profile-management-with-git-and-github/)). This file outlines some compiler options that I have, and some commands for cloning (for my own personal reference).

Tools
-----
This setup has been developed and tested with the following tools in mind:
- Mac OS X (10.7.4)
- Terminal.app
- Git (1.7.7.5, Apple Git-26)
- Vim (7.3, custom build)
Install the latest tested versions of each tool (compiled from source, of course) by running the scripts found in ~/.build/

Reinstallation
--------------
Run the following commands to reinstall all dotfiles back to the home directory:
 
    $ cd ~
    $ git clone --recursive git://github.com/kylewlacy/dotfiles.git
    $ mv dotfiles/{,.}* .
    $ mv .git .dotfiles.git

Notes
-----
If Command-T gives you errors, `cd .vim/bundles/command-t` and `rake make` it
