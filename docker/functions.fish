function de
        if count $argv > /dev/null
                docker exec -it $argv bash -c "stty cols $COLUMNS rows $LINES && bash"
        else
		echo "Specify container"                
        end
end
