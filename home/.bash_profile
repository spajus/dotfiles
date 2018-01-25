for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

shopt -s nocaseglob
shopt -s histappend

# Add tab completion for many Bash commands
if [ -x "$(which brew &> /dev/null)" ] && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion"
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

[ -f "/usr/share/git/completion/git-prompt.sh" ] && . /usr/share/git/completion/git-prompt.sh

eval "$(rbenv init -)"
