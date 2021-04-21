#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-versions
brew install awscli aws-shell ansible coreutils colordiff go node typescript \
	httpie htop git git-crypt groovy jmeter jq kafkacat maven python redis \
	stunnel telnet tree watch openssl wget yarn peco zsh
brew install --cask iterm2 cryptomator rectangle spotify sublime-text google-chrome flux \
	firefox-developer-edition slack docker skype bitwarden calibre evernote jetbrains-toolbox

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

for dotfile in .zshrc .gitconfig .gitignore
do
    ln -s -v -i ~/.dotfiles/${dotfile} ~
done
