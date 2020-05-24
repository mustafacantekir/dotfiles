export LANG=en_US.UTF-8
export LC_ALL=en_US.utf-8

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export ZSH="/Users/mustafa.can-tekir/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git brew colored-man-pages)

source $ZSH/oh-my-zsh.sh

alias json="python -m json.tool"
alias reload='source ~/.zshrc'

alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

gcob() { BRANCH=$1; git co $(git branch | grep --color=never $BRANCH | peco --select-1 --prompt "BRANCH>"); }

git-pull-all(){
	currentDirectory="$PWD";
	workspaceDirectory="~/Workspace";
	for f in "$workspaceDirectory"/*; do
	    cd "$f";
	    git pull;
	done
	cd $currentDirectory;
}

send-message() {
	TOPIC=$1
	FILE=$2
	cat $FILE | jq -c | \
	    kafkacat \
	    -b localhost:9092 \
	    -P -t $TOPIC -p 0 -T
}

read-message() {
	TOPIC=$1
	kafkacat -b localhost:9092 -C -t $TOPIC -p 0 -T
}

docker-rmli() {
	docker rmi $(docker images -q | head -1)
}
