#!/bin/bash
#set -x

JUPY_EXTS=$(jupyter labextension  list 2>&1 | awk '/^Disabled extensions:/{flag=1; next} /^$/{flag=0} flag' | while read name rest; do echo $name; done)

if [[ -n ${JUPY_EXTS} ]]; then
    for ext in ${JUPY_EXTS}; do
	echo "Enabling: $ext"
	jupyter labextension enable $ext
    done
else
    echo "No disabled extensions found."
fi
# Menu settings seem to be defined here
# /opt/conda/share/jupyter/lab/schemas/@jupyterlab/mainmenu-extension/plugin.json
# we assume that some one may have disabled some of the menus in the overrides
# /opt/conda/share/jupyter/lab/settings/overrides.json

# we are making the arbitrary choice to create a user prefrences that enables all
# menu items that may have been disable in the overrides
OVER_RIDES="/opt/conda/share/jupyter/lab/settings/overrides.json"
USER_MENU_SETTINGS="${HOME}/.jupyter/lab/user-settings/@jupyterlab/mainmenu-extension/plugin.jupyterlab-settings"

if [[ -a ${OVER_RIDES} ]]; then
   echo "Found ${OVER_RIDES}"
   if [[ -a ${USER_MENU_SETTINGS} ]]; then
       TS=$(date +'%F-%s')
       echo "  backing up ${USER_MENU_SETTINGS} ${USER_MENU_SETTINGS}.${TS}"
       cp ${USER_MENU_SETTINGS} ${USER_MENU_SETTINGS}.${TS}
   fi
   echo "creating ${USER_MENU_SETTINGS} by rewriting ${OVER_RIDES}"
   python -c "import json
f = open('${OVER_RIDES}')
resp = json.load(f)
print(json.dumps(resp['@jupyterlab/mainmenu-extension:plugin'], indent=4))
" | sed -e 's/"disabled": true,/"disabled": false,/g'  > ${USER_MENU_SETTINGS}
fi

echo "reload jupyterlab webpage for new setting to take effect"
