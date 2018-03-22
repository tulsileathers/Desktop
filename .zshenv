# Paths
export PATH="$PATH:/usr/local/Cellar:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/npm/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin"

# NVM for Node.js and NPM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
