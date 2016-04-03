
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/Applications/MAMP/Library/bin

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function gem(){
  $HOME/.rbenv/shims/gem $*
  if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
  then
    rbenv rehash
  fi
}

# function bundle(){
#   $HOME/.rbenv/shims/bundle $*
#   if [ "$1" = "install" ] || [ "$1" = "update" ]
#   then
#     rbenv rehash
#   fi
# }
export NVM_DIR="/Users/yamasakitaishi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
