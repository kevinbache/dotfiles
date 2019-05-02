# My Dotfiles
This repo lets you keep your dotfiles and preferences under version control. 

Here's the basic idea: `all/home` contains a replica of a home
directory for all *nix systems with all the preferences and dotfiles that you want.  
`osx/home` contains osx specific addons.  These files stay here and we'll create 
symlinks to them from your real home directory.  

Whenever you want to, you run `link_files.py` which 1) backs up the appropriate 
existing files 2) creates the necessary directories in your home folder, and 3) 
creates a symlink to every file in the home folders here.  Existing are backed up to
`${HOME}/.dotfiles_backup` or `${HOME}/.dotfiles_backup_2` or `..._3` if the backup
directory already exists, so you can safely run `link_files.py` all you want.

`utils/colortest.sh` is useful for picking bash prompt colors.

## .bash_profile
`${HOME}/.bash_profile` is fairly lightweight, but it sources all files found in 
`${HOME}/.profile_addons` which contains `alises.sh`, `functions.sh`, `bash_prompt.sh` 
and a bunch of application-specific settings.  

## .vimrc
The first time you open vim, you should run `:PlugInstall` to install all plugins 
which are added with `plug.vim` in the `.vimrc` file.