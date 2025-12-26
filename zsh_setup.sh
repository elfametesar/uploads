sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/agnoster/agnoster-zsh-theme ~/.oh-my-zsh/themes/agnoster
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
sed -i 's/ZSH_THEME.*/ZSH_THEME="robbyrussell"/' ~/.zshrc 
sed -i '/plugins/ {s/)/ zsh-syntax-highlighting zsh-autosuggestions)/}' ~/.zshrc
cat <<EOF > ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

PROMPT='%(?:%{$fg_bold[green]%}%1{%(!.#.➜)%}:%{$fg_bold[red]%}%1{%(!.#.➜)%}) %{$fg[cyan]%}$(pwd)%{$reset_color%}'
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
EOF

echo "HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word" >> ~/.zshrc
