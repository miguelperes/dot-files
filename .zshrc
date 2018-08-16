export ZSH=/home/miguel/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  git-open # https://github.com/paulirish/git-open
  zsh-autosuggestions # github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Alias
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias gs="git status"
alias git-rm-merged="git branch --merged | grep -v 'master' | cut -c 3- | xargs git branch -d"

# Functions

function solo {
 unset GIT_COMMITTER_NAME
 unset GIT_COMMITTER_EMAIL
 echo "Unsetting pair."
}

function pair_with_ {
 export GIT_COMMITTER_NAME=$1
 export GIT_COMMITTER_EMAIL=$2
 echo "Setting"  $1  "as pair."
}

function pair_with_john {
   pair_with_ "John Doe" "john.doe@gmail.com"
}

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
