function g 
	if count $argv > /dev/null
		command git $argv
	else
		git status --short --branch
	end
end
