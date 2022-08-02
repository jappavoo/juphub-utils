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
@jupyterlab/inspector-extension:notebooks"


for ext in ${JUPY_EXTS}; do
    echo "Enabling: $ext"
    jupyter labextension enable $ext
done
