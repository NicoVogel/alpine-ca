# Info

This image can be used to develop ASM code.
It conditions the following components:

- Dosbox
- Fasm
- Verilog (from the *testing* package)

To access dosbox, VNC is installed as well.
The following Volumes can be used:

- **/dosbox** : does contain the afd.exe (debugger)
- **/verilog** : is empty

VNC is published at **5900**.

## Further links

To create the image I needed (for my university stuff), I combined the following repos:

- [dosbox](https://hub.docker.com/r/tudorh/dosbox)
- [fasm](https://hub.docker.com/r/guitmz/fasm/dockerfile)
- [afd](https://github.com/soothscier/assembly-nasm)

The base image repo can be found here: [alpine-vnc](https://github.com/NicoVogel/alpine-vnc)