<p align="center" width="100%">
    <img width="50%" src="misc/doomguy_geek.png"> 
</p>

# Trajectory Doom

This is a fork of the Chocolate Doom source port, modified to track player location and other statistics for research purposes.

## Getting Started

These instructions will help you compile and run the project on a Debian-based Linux distribution (like Ubuntu).

### 1. Install Prerequisites

First, you need to install the necessary SDL libraries required to build the project. Open your terminal and run the following command:

```bash
sudo apt update
sudo apt install libsdl2-dev libsdl2-mixer-dev libsdl2-net-dev autoconf automake libtool build-essential
````

### 2\. Build from Source

Next, navigate to the project's root directory and run the following commands to compile the source code:

```bash
./autogen.sh
make -j4
```

  * `autogen.sh` prepares the build environment.
  * `make -j4` compiles the project, using 4 CPU cores to speed up the process.

If you have any problems with more recent C/C++ compiler give a try with:

```bash
make clean
./autogen.sh CFLAGS="-std=gnu11"
make -j4
```

* `make clean` will remove any previous configuration to start over.
* `autogen.sh CFLAGS="-std=gnu11"` will prepare the configuration using version GNU 11 which is able to compile chocolate-doom without issues.
* `make -j4` see above.

### 3\. Run the Game

To run the game, you need to provide a path to a Doom IWAD file (e.g., `DOOM.WAD`, `DOOM2.WAD`).
[!NOTE] 
Have a look at misc/OriginalWADs folder... 

From the project's root directory, execute the following command, making sure to adjust the path to your WAD file:

```bash
src/chocolate-doom -iwad /path/to/your/DOOM.WAD
```

Other useful parameters for debugging are:

```bash
src/chocolate-doom src/chocolate-doom -warp 2 4 -geometry 640x480 -iwad /path/to/your/DOOM.WAD
```
* `-warp E M`, where E stand for 'Episode' and M stand for 'Map'.  It will start chocolate-doom in the specific episode E and map M.
* `-geometry WxH`, where W stand for 'Width' and H stand for 'Height'.  It will start chocolate-doom in a window with WxH dimensions.  It can be useful to monitor the console output during the game.

Enjoy\!
