if [[ -d /opt/app-root/src/bin ]]; then
    cat  >>~/.profile <<EOF

# add persistent user bin to path
if [[ -d /opt/app-root/src/bin ]]; then
  export PATH=/opt/app-root/src/bin:\$PATH
fi
EOF
fi
