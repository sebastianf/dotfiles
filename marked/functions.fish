function mark 
	if count $argv > /dev/null
		command open -a "Marked 2" $argv
	else
		command open -a "Marked 2"
	end
end

function markv
	if count $argv > /dev/null
		if test -e $argv
			command open -a "Marked 2" $argv; vim $argv
		else
			command touch $argv; open -a "Marked 2" $argv; vim $argv
		end
	else
		command open -a "Marked 2"; vim
	end
end
