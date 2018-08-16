export ZSH=/home/miguel/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  git-open # https://github.com/paulirish/git-open
  zsh-autosuggestions # github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias gs="git status"
alias git-rm-merged="git branch --merged | grep -v 'master' | cut -c 3- | xargs git branch -d"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
