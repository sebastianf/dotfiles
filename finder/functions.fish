function change_directory_finder --description "cd's into the current front-most open Finder window's directory"
	cd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
end
