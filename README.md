This repository contains pre-compiled binaries of the Godot game engine,
version 2.1, for the Raspbian distribution.

To create games with it, you need at least a Pi 2 (with the new OpenGL driver
enabled), or a similar board.

I have found that on a Pi 3B+ (not overclocked), Godot 2.1 is pretty snappy,
but, even on a Pi 2, it is fairly useable. While these binaries have not been
tested on a Pi 4, they should work.

Please note that this is an old version of Godot, and more recent versions are
available. See here: <https://godotengine.org>.

## Installing Godot 2.1 on Raspbian

First, add the public key of this repository to apt:

    wget -O - https://efornara.github.io/godot2-rpi-repo/efornara-repos.key | sudo apt-key add -

Then, add the repository to apt. Download an apt entry:

    wget https://efornara.github.io/godot2-rpi-repo/godot2-rpi.list

Or create it yourself:

    # Godot 2.1 for Raspbian
    deb https://efornara.github.io/godot2-rpi-repo buster main

And copy it into `/etc/apt/sources.list.d`:

    sudo cp godot2-rpi.list /etc/apt/sources.list.d

Finally, after an update:

    sudo apt update

You can install godot2:

    sudo apt install godot2 godot2-doc

You strictly don't need to install `godot2-doc` and if you are short on space
you can skip it (it is around 250M uncompressed), but it is really recommended
that you do: the Godot documentation is pretty extensive.

## Development Versions

The version of the editor installed by default (`godot2-editor-stable`) is the
unpatched 2.1.6-stable from upstream with only some compilation options
changed to improve performance (i.e. hard-float and thinLTO).

This repository also includes slightly modified builds targeted at single
board computers. For example, `godot2-editor` uses EGL and GLESv2 instead of
GLX and GL to allow you to use the native graphics library of your board
directly, without a shim. Source can be found at
<https://github.com/efornara/godot>.

## Debian and Armbian

The packages in this repository should also be useable on armhf systems based
on Debian and Armbian. If you want to rebuild the executables in this
repositories changing some compilation flags to better target your own board,
you can use `compile.sh` as a starting point.

## Resources

- [Online Godot 2.1 Documentation](https://docs.godotengine.org/en/2.1/learning/step_by_step/index.html) -
  Browse `godot2-doc` online.

- [Godot 101: Learning the Godot Game Engine](https://www.youtube.com/playlist?list=PLsk-HSGFjnaFISfGRTXxp65FXOa9UkYc5) -
  15 videos, 3h 6m.

- [Godot 2.1 Tutorials](https://www.youtube.com/playlist?list=PLhqJJNjsQ7KEr_YlibZ3SBuzfw9xwGduK) -
  34 videos, 8h 11m.

- [Godot Engine Tutorial - Flappy Bird](https://www.youtube.com/playlist?list=PLv3l-oZCXaql20IlPe7gfBEzomnPSLekY) -
  14 videos, 4h 1m.

- [Make a Space Shooting Game in Godot](https://www.youtube.com/playlist?list=PLv3l-oZCXaqkUEqrLsKJIAhAxK_Im6Qew) -
  17 videos, 2h 5m.
