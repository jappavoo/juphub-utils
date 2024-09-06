#!/bin/bash
#set -x

JUPY_EXTS="@jupyterlab/fileeditor-extension:plugin
@jupyterlab/filebrowser-extension:widget
@jupyterlab/filebrowser-extension:browser
@jupyterlab/filebrowser-extension:download
@jupyterlab/filebrowser-extension:open-browser-tab
@jupyterlab/filebrowser-extension:open-with
@jupyterlab/console-extension:tracker
@jupyterlab/console-extension:foreign
@jupyterlab/debugger-extension:main
@jupyterlab/extensionmanager-extension:plugin
@jupyterlab/launcher-extension:plugin
@jupyterlab/apputils-extension:palette
@jupyterlab/logconsole-extension:plugin
@jupyterlab/codemirror-extension:commands
@jupyterlab/inspector-extension:consoles
@jupyterlab/inspector-extension:inspector
@jupyterlab/inspector-extension:notebooks
@jupyterlab/shortcuts-extension:shortcuts
jupyterlab-jupytext
@jupyterlab/workspaces-extension
@jupyterlab/git"

#JUPY_EXTS=""

for ext in ${JUPY_EXTS}; do
    echo "Enabling: $ext"
    jupyter labextension enable $ext
done

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
