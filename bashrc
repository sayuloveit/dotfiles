# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND=$PROMPT_COMMAND' PS1="${c_path}\W${c_reset}$(git_prompt) => "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
  # Is this a git directory?
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

export NVM_DIR="/Users/vic/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# search for LSCOLORS
export LSCOLORS=GxGxFxdxCxDxDxaccxaeex

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# allows for automatic activation of venv after cd into dir
source /usr/local/opt/autoenv/activate.sh

# source alias
source ~/.dotfiles/alias
