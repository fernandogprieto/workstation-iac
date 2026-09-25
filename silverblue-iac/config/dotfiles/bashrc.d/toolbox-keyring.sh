# Start GNOME keyring inside toolbox so VS Code can store secrets
if [ -f /run/.toolboxenv ]; then
    eval $(gnome-keyring-daemon --start --components=secrets 2>/dev/null)
    export SSH_AUTH_SOCK
fi
