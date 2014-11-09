for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file" && echo "sourcing $file";
done;
unset file;

shopt -s nocaseglob;
shopt -s histappend;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  echo "enabling bash completion from brew";
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  echo "enabling bash completion from /etc/bash_completion";
  source /etc/bash_completion;
fi;

