#!/bin/bash

# File to store tasks
taskfile=/home/$USER/taskmanager

if [ -e $taskfile ]
then
	:
else
	touch $taskfile
fi


# Add a new task
if [ "$1" = "add" ] 
# $2 - name of task
# $3 - priority
# $4 - optional arg, deadline
then
	taskid=$(wc -l < $taskfile)
	task="$taskid,${3},${2},${4}"
	echo $task >> $taskfile
fi

#print current tasks
if [ "$1" = "ls" ]
then
	while IFS= read -r line
	do
		var=($(echo "$line" | tr ',' '\n'))
  		echo "${var[*]}"
	done < $taskfile
fi

# complete a task
if [ "$1" = "complete" ]
then
	sed -i $2d $taskfile
fi
