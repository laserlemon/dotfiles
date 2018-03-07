# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
fi;

# Add tab completion for Git
if which brew &> /dev/null && [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash";
fi;
