export ZSH=/home/miguel/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  git-open # https://github.com/paulirish/git-open
  zsh-autosuggestions # github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# --- ALIASES

# Shortcuts
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshconfig="code ~/.zshrc"
alias gitconfig="code ~/.gitconfig"
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Git
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

# Quickly toggle Delta diff to show side-by-side view
function delta_sbs {
        TOGGLE=$1
        git config --global delta.side-by-side $TOGGLE
        echo "Delta: side-by-side diff set to $TOGGLE"
}

# Shortcut to view the diff between a commit and its parent
function diff_parent {
    COMMIT_HASH=$1
    git diff $COMMIT_HASH\^ $COMMIT_HASH
}

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
