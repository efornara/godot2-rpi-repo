This repository contains pre-compiled binaries of the Godot game engine,
version 2.1, for the Raspbian distribution.

To create games with it, you need at least a Raspberry Pi 2 with the new
OpenGL driver enabled.

I have found that on a Raspberry Pi 3B+ (not overclocked), Godot 2.1 is pretty
snappy, but, even on a Raspberry Pi 2, it is fairly useable.  While these
binaries have not been tested on a Raspberry Pi 4, they should work.

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

## Stable Versions

The versions installed by default are slightly modified compared to
2.1.6-stable from upstream. If you prefer the unpatched versions, they are
available as `godot2-editor-stable` and `godot2-runner-stable`.

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
