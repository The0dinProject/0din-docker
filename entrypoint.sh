#!/bin/bash
latest_commit=$(git log -1 --pretty=format:"%H")
latest_commit_full=$(git log -1 --pretty=format:"%H %cd %s" --date=local)
setting_json_file="settings.json"
echo
echo "Welcome to..."
echo '  ______     _ _       '
echo ' / __   |   | (_)      '
echo '| | //| | _ | |_ ____  '
echo '| |// | |/ || | |  _ \ '
echo '|  /__| ( (_| | | | | |'
echo ' \_____/ \____|_|_| |_|'
echo
echo "Latest commit : $latest_commit_full"
echo "URL           : https://github.com/4rtemis-4rrow/0din/commit/$latest_commit"
echo
echo "╭───────────────────────╮"
echo "│ Docker Env Vars... ⤵️  │"
echo "╰───────────────────────╯"
echo
echo "> ADMIN_USER              : $ADMIN_USER"
echo "> ADMIN_PASSWORD          : $ADMIN_PASSWORD"
echo "> NODE_ID                 : $NODE_ID"
echo "> NODE_PORT               : $NODE_PORT"
echo "> ENABLE_SSL              : $ENABLE_SSL"
echo "> ENABLE_HTTPS_REDIRECT   : $ENABLE_HTTPS_REDIRECT"
echo "> KNOWN_NODES             : $KNOWN_NODES"
echo "> DB_USER                 : $DB_USER"
echo "> DB_PASSWORD             : $DB_PASSWORD"
echo "> DB_NAME                 : $DB_NAME"
echo "> DB_HOST                 : $DB_HOST"
echo "> DB_PORT                 : $DB_PORT"
echo
echo "╭────────────────────────╮"
echo "│ Configuring 0din... ⏳ │"
echo "╰────────────────────────╯"
echo
if [ "$ENABLE_HTTPS_REDIRECT" = "true" ]; then
    echo "ENABLE_HTTPS_REDIRECT is enabled."
    echo ">>> Updating NODE_ID & PORT_ID... ✅"
    sed -i -e "s/127.0.0.1:5000/$NODE_ID/" "$setting_json_file"
else
    echo "ENABLE_HTTPS_REDIRECT is not enabled."
    echo ">>> Updating NODE_ID & PORT_ID... ✅"
    sed -i -e "s/127.0.0.1/$NODE_ID/" -e "s/5000/$NODE_PORT/" "$setting_json_file"
fi
echo
echo "╭─────────────────────╮"
echo "│ Starting 0din... 🚀 │"
echo "╰─────────────────────╯"
echo
# exec "$@"
python 0din.py