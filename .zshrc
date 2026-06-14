export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:~/.local/distrobox/bin

export ZSH="$HOME/.oh-my-zsh"
export VSCODE="~/Downloads/git/visual-studio-code-bin/src/VSCode-linux-x64/bin/code"


alias code="$VSCODE"
alias devbox="distrobox enter udev"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github

ZSH_THEME="my-sunaku"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/chrum/.bun/_bun" ] && source "/home/chrum/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
