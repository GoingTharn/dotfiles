# John's Dotfiles

These are my personal dotfiles, stolen from Andrew. 

```
curl -L andrew.cloud/dotfiles.sh | sh
```

![Screenshot of my dotfiles](images/screenshot.png)

These dotfiles are intended for use with zsh, [oh-my-zsh][], and the
[solarized][] colorscheme.
The configuration uses powerline-based status bars for vim and tmux and
[Powerlevel10k][powerlevel10k] as its zsh theme.

## Try it out in Docker

These dotfiles are available as a [Docker image][docker-hub].
It's the easiest way to emulate the development environment that I normally use.
To spin up a new container, install Docker and run the command below.

```shell
docker run -it docker.io/liuandrewk/dotfiles
```

You should also make sure to have Powerline fonts available in your terminal.
It'll otherwise work out of the box.

## Prerequisites

These dotfiles contain the following software dependencies:

* Linux, MacOS, or WSL
* Neovim 0.7 (preferred) or Vim 8

There currently is no Windows support.
However, MacOS and most flavors of Linux should work fine.

## Setting up your Local Machine

_[Go to the next section](#installation) if you have already configured these
dotfiles on your machine once, or if you are SSHing into another machine.
These setup instructions only need to be done once on a local machine._

New machines require two tasks to be done which are not part of the setup
script:

* Installing (and using) Powerline/FontAwesome-compatible fonts.
* Using the Solarized colorscheme.

### MacOS

#### Installing Fonts with Custom Glyph Support

We will be using [Nerd Fonts][nerd-fonts] to patch in all of our symbols.
This font aggregator is nice in the sense that it collects many different glyphs
from various sources.
(We'll be using a lot of different symbols!)

Follow the [Powerlevel10k font instructions][p10k-fonts] to install the proper
fonts.

```shell
p10k configure
```

The Text section of my iTerm settings looks like the picture below.

![Text section of iTerm settings](images/iterm_options.png)

#### Solarized on iTerm

The Solarized colors for iTerm can be found in its
[official repository][solarized-repo].
(You won't need to download it.)
In the `Colors` section of your iTerm profile, use the `Solarized Dark` preset.

#### Enable Copy/Paste in Tmux

On Macs, `pbcopy` and `pbpaste` don't natively work in tmux.
Luckly there's a [Homebrew][homebrew] formula to fix that.

```shell
brew install reattach-to-user-namespace
```

The tmux configuration will do the rest for you.
Note that this only applies to machines running MacOS.

#### Enable Mouse Wheel Scrolling in Vim on iTerm

If using iTerm, setting `Scroll wheel sends arrow keys when in alternate screen
mode.` to `Yes` will allow trackpad scrolling while in Vim.
The setting can be found in the advanced preferences.

#### Enabling the Meta Key on iTerm

If using iTerm, you may want to set the option key mode to `Esc+` to make it be
a meta key.
It's used for a few shortcuts, such as resizing tmux panes.

#### Bold Text Color

Uncheck the `Brighten Bold Text` option in iTerm if all bold text is gray.

### Linux

#### Downloading Fonts for Linux

Similarly to that of MacOS, you'll need to fetch modified fonts.
We'll install the same font that we use for MacOS, although setting it up is
rather different.

```shell
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
# Download the Droid Sans Mono from the latest Nerd Font release.
# We don't download from master due to lack of stability guarantees.
curl -fLo "Droid Sans Mono Nerd Font Complete.otf" \
  https://github.com/ryanoasis/nerd-fonts/raw/2.0.0/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

This is Gnome, since I'm running with it for a while. 
After downloading the font, install Gnome Tweak UI. 
Change the MonoSpaceFont to be Droid Sans Mono Nerd. Keep the default font terminal on the Preferences. 

#### Solarized on Ubuntu Terminal

To get Solarized on the Ubuntu Terminal, you will want to create a new profile.
The solarized colorscheme should be a default option on most modern terminals.
If it's not default, follow the instructions in
[gnome-terminal-colors-solarized][] to set the color scheme.

### Other optional tools

There are a few recommended (but optional) tools you can install to improve your
shell experience in general.

* [`delta`][delta]: Delta is a diffing tool that works great with git.
* [`rg`][rg]: Ripgrep is a faster alternative over `ag`, `ack`, and `grep`.
* [`fzf`][fzf]: Fzf is a highly performant fuzzy finder.
* [`fd`][fd]: `fd` is a faster alternative to the `find` command. It works very
  well when paired with `fzf`.
* [`exa`][exa]: An improved version of `ls`. We use its tree feature to improve
  the output of `<alt-c>` from `fzf` and directory tab completion.
* [`bat`][bat]: An improved version of `cat`. We use it for the file previews
  when running `<ctrl-t>` from `fzf`.
* [`ctags`][universal-ctags]: Universal ctags help you jump around function
  definitions in a code base.
* [`rupa/z`][rupa/z]: cd db

You should install all of these independently of this dotfile repo.
Figuring out how to install them is left as an exercise for the reader.

## Installation

Installation is as simple as downloading and running the install script.
The install script will run the configuration script, which fetches oh-my-zsh
and symlinks the dotfiles to your home directory.

```shell
curl https://dev.goingtharn.com/dotfiles.sh | sh
# or
wget -qO- https://dev.goingtharn.com/dotfiles.sh | sh
```

Alternatively, you can manually clone the repository and run the `setup.sh`
script.

```shell
git clone --filter=blob:none git@github.com:GoingTharn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh -t build
```

You will also likely need to manually change your shell to `zsh` if you are
currently using a different shell.

```shell
chsh -s $(which zsh)
```

## Customizing

You can customize zsh, vim, tmux, and git for each specific machine.
Just put any additional configurations in the following files:

* `~/.zshrc.local`
* `~/.vimrc.local`
* `~/.tmux.conf.local`

Custom git configurations can be placed in `~/.gitconfig`.
The normal git config file is not put under version control, so it's safe to put
machine-specific tokens in it.

## Docker

If you'd like to build the dotfiles as a Docker image locally, run the following
command:

```shell
docker build -t liuandrewk/dotfiles .
```

The image will be a bit large (1 GB), so it's best saved for development
purposes only.

## Teardown

To clean up the dotfiles, run the configuration script with the `clean`
argument.
It will remove all symlinks, but zsh and oh-my-zsh will be untouched.
If you wish to remove those, you will have to manually delete them.

```shell
cd ~/.dotfiles
./setup.sh -t clean
rm -rf ~/.oh-my-zsh # optionally remove oh-my-zsh
chsh -s $(which bash) # optionally change shell back to bash
```

[solarized]: <http://ethanschoonover.com/solarized>
[homebrew]: <http://brew.sh/>
[oh-my-zsh]: <https://github.com/robbyrussell/oh-my-zsh>
[delta]: https://github.com/dandavison/delta
[nerd-fonts]: <https://github.com/ryanoasis/nerd-fonts>
[p10k-fonts]: https://github.com/romkatv/powerlevel10k/#meslo-nerd-font-patched-for-powerlevel10k
[gnome-terminal-colors-solarized]: <https://github.com/Anthony25/gnome-terminal-colors-solarized>
[solarized-repo]: <https://github.com/altercation/solarized>
[rg]: <https://github.com/BurntSushi/ripgrep>
[fd]: <https://github.com/sharkdp/fd>
[fzf]: <https://github.com/junegunn/fzf>
[bat]: <https://github.com/sharkdp/bat>
[universal-ctags]: <https://github.com/universal-ctags/ctags>
[itermcolors]: <https://raw.githubusercontent.com/altercation/solarized/e40cd4130e2a82f9b03ada1ca378b7701b1a9110/iterm2-colors-solarized/Solarized%20Dark.itermcolors>
[powerlevel10k]: <https://github.com/romkatv/powerlevel10k>
[rupa/z]: <https://github.com/rupa/z>
[exa]: https://github.com/ogham/exa
[docker-hub]: https://hub.docker.com/r/liuandrewk/dotfiles
