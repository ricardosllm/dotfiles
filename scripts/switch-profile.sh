#!/usr/bin/env bash

# Quick profile switcher for work/personal accounts

set -e

PROFILE="${1}"

if [ -z "$PROFILE" ]; then
    echo "Usage: $0 [work|personal]"
    echo "Switch between work and personal user accounts"
    exit 1
fi

case "$PROFILE" in
    work)
        echo "Switching to work profile..."
        # Fast user switching on macOS
        /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -switchToUserID $(id -u ricardo-work)
        ;;
    personal)
        echo "Switching to personal profile..."
        /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -switchToUserID $(id -u ricardo-personal)
        ;;
    *)
        echo "Invalid profile: $PROFILE"
        echo "Valid options: work, personal"
        exit 1
        ;;
esac