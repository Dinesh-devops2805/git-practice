#!/bin/bash

set -e   # setting the automatic exit, if we get error, set -ex for debug

failure(){
    echo "Error at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR  # ERR is an error signal

echo "Hello world"
echoooooo "Hello world"
echo "Hello world after failure"