# How to make your own dotfiles repository:

## Step one:

Create a repository on github. You don't *have* to call it 'dotfiles'
but that name will be used in this example.

## Step two:

Clone it. 
    
    git clone git@github.com:username/dotfiles.git

The message telling you that "you appear to have cloned an empty
repository" is to be expected.

## Step three:

The part that is 'empty' is the containing folder 'dotfiles', not the
.git folder inside. Move the 'dotfiles/.git' folder to the outside of
'dotfiles', renaming it to 'dotfiles.git' to distinguish it from the
already existing 'dotfiles' folder. 

    mv dotfiles/.git dotfiles.git

Go ahead and remove the 'dotfiles' folder. (The one without the .git
suffix.)

    rm -rf dotfiles

## Step four:

Configure the repository so that it knows it is supposed to be 'bare'.

    git --git-dir=/path/to/dotfiles.git config core.bare true

## Step five:

Now that it is bare, you can't just cd into the containing folder and
issue git commands to it. You have to explicitly specify it as the git
dir when you're talking to git about it, and it also helps if you're
explicit about the work tree so make an alias for when you're dealing
with this one repository:

    alias dotfiles="git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"

Instead of saying ``git add somefile`` you will say ``dotfiles add somefile``, instead
of saying ``git commit -m some-message`` you will say ``dotfiles commit -m
some-message``, and instead of saying ``git push``, you will say ``dotfiles push``.

