#!/bin/bash

# Ambil nama branch aktif, default ke 'main' kalau belum ada branch
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ "$BRANCH" == "HEAD" ] || [ -z "$BRANCH" ]; then
    BRANCH="main"
    git checkout -b "$BRANCH"
fi

# Commit 100 kali
for i in {1..146}
do
    echo "Auto change $i" >> auto_commit_log.txt
    git add .
    git commit -m "update #$i - $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin "$BRANCH"
    sleep 2  # Delay 2 detik biar aman dari deteksi spam
done

