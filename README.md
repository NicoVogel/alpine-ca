# Alpine Computer Architecture

This image can be used to develop ASM code.
It conditions the following components:

- Dosbox
- Fasm
- Verilog (from the *testing* package)

To access dosbox, VNC is installed as well.
The following Volumes can be used:

- **/dosbox/bin** : does contain the afd.exe (debugger)
- **/verilog** : is empty

VNC is published at **5900**.

## Run Scripts

The runDocker.sh and runDocker.ps1 uses run if no container exists and start if it exists. They use the current path to map **./dosbox** and **./verilog** to the container. Furthermore the the script accepts the first parameter. It simply checks if the defined character is part of the first argument.

````bash
# linux
runDocker.sh r

# windows
runDocker.ps1 r
````

Use docker rm to delete the container and start from scratch

````bash
runDocker.ps1 t
````

Is needed if you use Docker-Toolbox (corrects the path)

> Dont forget to share the folder in VirtualBox or the drive in Docker for Windows

## Further links

To create the image I needed (for my university stuff), I combined the following repos:

- [dosbox](https://hub.docker.com/r/tudorh/dosbox)
- [fasm](https://hub.docker.com/r/guitmz/fasm/dockerfile)
- [afd](https://github.com/soothscier/assembly-nasm)

The base image repo can be found here: [alpine-vnc](https://github.com/NicoVogel/alpine-vnc)
