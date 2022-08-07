#!/bin/bash
#set -x
ENVFILE=~/.sa.env

if [[ ! -a ~/.sa.env ]]; then
    ssh-agent > $ENVFILE
    . $ENVFILE
    ssh-add
    if ! grep -q $ENVFILE ~/.bashrc ; then
	cat >> ~/.bashrc <<EOF
# sourcing  $ENVFILE if it exits
[[ -a $ENVFILE ]] && . $ENVFILE > /dev/null
EOF
    fi
else
   . $ENVFILE
fi
