#!/bin/bash

echo "Executing $0 in $1"

find $1 -perm -22

# This command does search for files which are writable by  both  their  owner  and  their group.
