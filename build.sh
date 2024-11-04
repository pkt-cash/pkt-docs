#!/bin/bash

if [ -e ./env/bin/activate ] ; then
    . ./env/bin/activate
else
    rm -rf ./env
    mkdir ./env
    python3 -m venv ./env
    . ./env/bin/activate
fi

pip install mkdocs
pip install ./theme-moonstone
mkdocs build

for arg in "$@"; do
    if [ "$arg" = "serve" ]; then
        mkdocs serve
    fi
done