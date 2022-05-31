if [[ -d /opt/app-root/src/juphub-utils ]]; then
    cat  >>~/.profile <<EOF

# add persistent user bin to path
if [[ -d /opt/app-root/src/juphub-utils ]]; then
  export PATH=/opt/app-root/src/juphub-utils:\$PATH
fi
EOF

# Kludge when running locally profile is started before startup hook so we
# explicitly add to path here
export PATH=/opt/app-root/src/juphub-utils:$PATH
    
fi
