#!/bin/bash
echo
echo "Welcome to..."
echo '  ______     _ _       '
echo ' / __   |   | (_)      '
echo '| | //| | _ | |_ ____  '
echo '| |// | |/ || | |  _ \ '
echo '|  /__| ( (_| | | | | |'
echo ' \_____/ \____|_|_| |_|'
echo
echo "Starting entrypoint..."
echo
echo "╭───────────────────────╮"
echo "│ Docker Env Vars... ⤵️  │"
echo "╰───────────────────────╯"
echo
echo "> ADMIN_USER      : $ADMIN_USER"
echo "> ADMIN_PASSWORD  : $ADMIN_PASSWORD"
echo "> NODE_ID         : $NODE_ID"
echo "> NODE_PORT       : $NODE_PORT"
echo "> URL             : $URL"
echo "> KNOWN_NODES     : $KNOWN_NODES"
echo
echo "╭────────────────────────╮"
echo "│ Configuring 0din... ⏳ │"
echo "╰────────────────────────╯"
echo
echo "Updating NODE_ID & PORT_ID..."
setting_json_file="settings.json"
sed -i -e "s/127.0.0.1/$NODE_ID/" -e "s/5000/$NODE_PORT/" "$setting_json_file"
echo
echo "Enabling flash debug..."
FLASK_DEBUG=1
echo
echo "╭─────────────────────╮"
echo "│ Starting 0din... 🚀 │"
echo "╰─────────────────────╯"
echo
python Odin.py