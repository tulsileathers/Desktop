# Set Ruby Version for RVM
RUBY="ruby-2.3.3"

# Set RVM path for Ruby/Rails/Bundler/Gems
RVM="/Users/${username}/.rvm/gem/${RUBY}"

# Paths
export PATH="$PATH:/usr/local/Cellar:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/npm/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin"

# NVM for Node.js and NPM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# This is necessary to use RVM / Ruby / Rails / Bundle inside of Spacemacs
export GEM_PATH="$RVM:${RVM}@global"
export GEM_HOME="$RVM"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
