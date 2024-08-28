#!/bin/bash

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

for ext in ${JUPY_EXTS}; do
    echo "Enabling: $ext"
    jupyter labextension enable $ext
done

echo "resetting /opt/conda/share/jupyter/lab/settings/overrides.json"
cat <<EOF > /opt/conda/share/jupyter/lab/settings/overrides.json
{
    "@jupyterlab/terminal-extension:plugin": {
        "shutdownOnClose": true
    },
    "@jupyterlab/statusbar-extension:plugin": {
        "visible": false
    }
}
EOF

echo "reload jupyterlab webpage for new setting to take effect"
