#!/bin/bash
mkdir -m 0777 -p /soulsync/logs /soulsync/app

# Check if /soulsync/app exists and non empty
if [ -d "/soulsync/app" ] && [ -z "$(ls -A /soulsync/app)" ]; then    
    echo "[INFO] /soulsync/app empty, cloning project..."
    git clone https://github.com/Nezreka/SoulSync /soulsync/app
fi

cd /soulsync/app

# Start app
python3 main.py >> /soulsync/logs/app.log 2>&1 &

# Log to console for supervisord
exec tail -f /soulsync/logs/app.log