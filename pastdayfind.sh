#!/bin/bash

echo "Executing $0 in $1"

find $1 -mtime 0

#  Search for files in your home directory which have been modified in the last twenty-four hours.  This command
#  works this way because the time since each file was last modified is divided by 24 hours and any remainder is
#  discarded.  That means that to match -mtime 0, a file will have to have a modification in the past  which  is
#  less than 24 hours ago.
