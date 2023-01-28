#!/bin/bash

set -e

## Determine Current Directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

## Create CDROM location and Mount IMG
DRIVE_D="${DIR}/drive_d"
ISO="${DIR}/<game.iso>"
echo $DRIVE_D
echo $ISO

[ -d "${DRIVE_D}" ] || mkdir "${DRIVE_D}"
mount -o loop "${ISO}" "${DRIVE_D}"

ln -sfn "${DRIVE_D}" "${DIR}/dosdevices/d:"
ln -sf "${ISO}" "${DIR}/dosdevices/d::"

cd "${DIR}/drive_c/Program Files/PATH/TO/GAME/DIRECTORY/"

wineserver -k

env WINEARCH=win32 env WINEPREFIX="${DIR}" wine --unmount-on-exit <game.exe>

trap "fusermount -u ${DRIVE_D}" EXIT
