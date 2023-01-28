# GamingOnLinux
This where I'll keep my helper scripts to game on Linux using Wine. 

## Game_Start_Script
This script launches Windows PC games on Linux using the Wine compatibility layer. 
### How to use:
Wine must be installed and a prefix created for your game. (prefix is simply the game directory, e.g. /home/USER/GAME.) In this directory copy your legally obtained iso image, and mount the iso. Then install the game setting the environment variables.
```
env WINEARCH=win32 env WINEPREFIX=<DIR> wine setup.exe
```
Whereas \<DIR\> is the name of your game folder.

After the game is installed, you'll see
a dosdevices and drive_c folder in the game directory along with some reg files. This is where you'll place the game_start_script. 
In the script you'll need to change the ISO variable to the name of your legally obtained iso image's filename. You'll also need to change the PATH/TO/GAME/DIRECTORY/ to the... game directory within the drive_c folder. Then change the line with the wine command from <game.exe> to whatever the game executable's filename is.

It should load the ISO so that wine sees it as an optical rom drive, and then launch the game.... if the game works in Wine that is... 
