#!/bin/bash

# This script automates the virtual env creation and sourcing into it.

echo "Executing $0 in $PWD"

PWD=$(pwd)
VENV=$PWD/venv/

if [ -d "$VENV" ]; then
	echo "$VENV already exists..."
	exit 1
fi

if [ ! -d "$VENV" ]; then
  echo "Creating Virtual Environment"
	python3 -m virtualenv venv
	
fi

echo "sourcing into venv/bin/activate"
echo "(venv) will be missing from prompt."
echo "Proof of which python interpreters:"
source venv/bin/activate
which python
which python3
bash
