# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for many Bash commands
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
fi;

# Add tab completion for Git
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash";

  __git_complete ga _git_add
  __git_complete gap _git_add
  __git_complete gbr _git_branch
  __git_complete gco _git_checkout
  __git_complete gci _git_commit
  __git_complete gdf _git_diff
  __git_complete gfh _git_fetch
  __git_complete glg _git_log
  __git_complete gmg _git_merge
  __git_complete gpl _git_pull
  __git_complete gpr _git_pull
  __git_complete gph _git_push
  __git_complete gpf _git_push
  __git_complete grb _git_rebase
  __git_complete gri _git_rebase
  __git_complete grc _git_rebase
  __git_complete gra _git_rebase
  __git_complete grs _git_reset
  __git_complete gsh _git_stash
  __git_complete gsa _git_stash
  __git_complete gsp _git_stash
  __git_complete gst _git_status
  __git_complete grv _git_remote
  __git_complete grp _git_remote
fi;

# direnv configuration
eval "$(direnv hook bash)"
