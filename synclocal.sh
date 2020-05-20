#!/bin/bash

echo "Executing $0 in $1"

rsync -abviuzP $1 $2

# Local rsync; uses src/ dest/
