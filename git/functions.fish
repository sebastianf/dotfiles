function git 
	if count $argv > /dev/null
		command git $argv
	else
		git status --short --branch
	end
end

function fzf-git-branch -d "Fuzzy search and print git branch name"
  git-is-repo; or return 
  
  git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" (echo {} | sed "s/.* //")' |
        sed "s/.* //"
end

function fzf-git-checkout -d "Fuzzy search and checkout a git branch"
  git-is-repo; or return 

  set -l branch (fzf-git-branch)

  if test -z "$branch"
    echo 'No branch selected'
    return
  end

  # If branch name starts with 'remotes/' then it is a remote branch. By
  # using --track and a remote branch name, it is the same as:
  # git checkout -b branchName --track origin/branchName
  if string match -q 'remotes/*' $branch
    git checkout --track $branch
  else
    git checkout $branch;
  end
end

function git-is-repo -d "Check if directory is a repository"
  test -d .git; or command git rev-parse --git-dir >/dev/null 2> /dev/null
end
