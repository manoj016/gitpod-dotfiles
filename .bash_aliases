echo Hello Gitpod
echo Here is my .bash_aliases dotfile

# Custom Aliases
alias ll="ls -1a";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias vim="nvim"
alias vi="nvim"
alias vz="nvim ~/.zshrc";
alias cz="code ~/.zshrc";
alias sz="source ~/.zshrc; clear;";

## git aliases
alias gc="git commit -m";
alias gcs="git commit -S -m";
alias gs="git status";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias gaa="git add .";
alias gau="git add -u";
alias ga="git add";
dif() { git diff --color --no-index "$1" "$2" | diff-so-fancy; }
cdiff() { code --diff "$1" "$2"; }

function tag_delete {
  git tag -d "$1";
  git push origin --delete "refs/tags/$1";
}

# Custom functions
mg () { mkdir "$@" && cd "$@" || exit; }
cdl() { cd "$@" && ll; }
killport() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9 ;}

function react_hot_server {
  if [ -z ${1+x} ]; then 
    GIT_POD_URL=$(tailscale ip -4 gitpod-manoj-kumar-maharana-contexalyze) npm start --prefix react_frontend;
  else 
    GIT_POD_URL=$(tailscale ip -4 gitpod-manoj-kumar-maharana-contexalyze) npm start --prefix "$1/react_frontend"
  fi
}
