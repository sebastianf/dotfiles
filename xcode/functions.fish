function bundlePath 
	if count $argv > /dev/null
		command ./gradlew $argv
	else
		./gradlew	
	end
end
