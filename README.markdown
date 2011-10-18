## dotfiles

your dotfiles are how you personalize your system. These are mine.

## install

- `git clone git://github.com/chriskau/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

the install rake task will symlink the appropriate files in `.dotfiles` to your home directory. everything is configured and tweaked within `~/.dotfiles`, though.

the main file you'll want to change right off the bat is `zsh/zshrc.symlink`, which sets up a few paths that'll be different on your particular machine.

## topical

everything's built around topic areas. if you're adding a new area to your forked dotfiles — say, "Java" — you can simply add a `java` directory and put files in there. anything with an extension of `.zsh` will get automatically included into your shell. anything with an extension of `.symlink` will get symlinked without extension into `$HOME` when you run `rake install`.

## components

there's a few special files in the hierarchy.

- **bin/**: anything in `bin/` will get added to your `$PATH` and be made available everywhere.
- **topic/\*.zsh**: any files ending in `.zsh` get loaded into your environment.
- **topic/\*.symlink**: any files ending in `*.symlink` get symlinked into your `$HOME`. this is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. these get symlinked in when you run `rake install`.
- **topic/\*.completion.sh**: any files ending in `completion.sh` get loaded last so that they get loaded after we set up zsh autocomplete functions.

## bugs

i want this to work for everyone; that means when you clone it down it should work for you. that said, I do use this as *my* dotfiles, so there's a good chance I may break something if I forget to make a check for a dependency.

if you're brand-new to the project and run into any blockers, please [open an issue](https://github.com/chriskau/dotfiles/issues) on this repository and I'd love to get it fixed for you!

## thanks

this started out as a fork of [Zach Holman](http://github.com/holman)'s brilliant [dotfiles](http://github.com/holman/dotfiles)
