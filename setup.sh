#!/bin/bash
# script to run after cloning the this repo
# will install the startup hook script that
# is part of this repo 

BASEDIR=${BASEDIR:-/opt/app-root/src}
STARTUPHOOK=${BASEDIR}/.myjupyter_start.sh
MYDIR=$(readlink -f $0)
MYDIR=$(dirname $MYDIR)
STARTUPHOOKSRC=${MYDIR}/myjupyter_start.sh

if [[ ! -a ${STARTUPHOOK} ]]; then 
    if [[ -a ${STARTUPHOOKSRC} ]]; then
	ln -s ${STARTUPHOOKSRC} ${STARTUPHOOK}
    else
	echo "ERROR: can't find ${STARTUPHOOKSRC}"
	exit -1
    fi
fi
