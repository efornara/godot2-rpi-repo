This repository contains pre-compiled binaries of the Godot game engine,
version 2.1.

To create games with it, you need at least a Raspberry Pi 2 with the new
OpenGL driver enabled.

I have found that on a Raspberry Pi 3B+ (not overclocked), Godot 2.1 is pretty
snappy, but, even on a Raspberry Pi 2, it is fairly useable.
While these binaries have not been tested on a Raspberry Pi 4, they should
work.

Please note that this is an old version of Godot, and more recent versions are
available.

## Installing Godot 2.1

First, add the public key of this repository to apt:

    wget -O - https://efornara.github.io/godot2-rpi-repo/efornara-repos.key | sudo apt-key add -

Then, add the repository to apt. Download an apt entry:

    wget https://efornara.github.io/godot2-rpi-repo/godot2-rpi.list

Or create it yourself:

	# Godot 2.1 for Raspbian
    deb https://efornara.github.io/godot2-rpi-repo buster main

And copy it to `/etc/apt/sources.list.d`:

    sudo cp godot2-rpi.list /etc/apt/sources.list.d

Finally, after an update:

    sudo apt update

You can install godot2:

    sudo apt install godot2 godot2-doc

You strictly don't need to install `godot-doc` and if you are short on space
you can skip it (it is around 250M), but it is really recommended that you do:
the Godot documentation is pretty extensive.
