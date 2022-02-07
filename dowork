#!/bin/bash
if [[ ! -a ~/Work && -a /opt/app-root/src ]]; then
  echo "linking: ln -s /opt/app-root/src ~/Work"
  ln -s /opt/app-root/src ~/Work
fi

if [[ ! -L ~/.jupyter/lab && -a /opt/app-root/src ]]; then
    if [[ ! -a /opt/app-root/src/jupyter/lab ]]; then
	mkdir -p /opt/app-root/src/jupyter/lab
    fi
    [[ -a ~/.jupyter/lab ]] && mv ~/.jupyter/lab ~/.jupyter/lab.old
    echo "linking: ln -s /opt/app-root/src/jupyter/lab ~/.jupyter/lab"
    ln -s /opt/app-root/src/jupyter/lab ~/.jupyter/lab
fi
   
