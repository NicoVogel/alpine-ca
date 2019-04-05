FROM birddock/alpine-vnc

ENV FASM_VERSION 1.73.09
USER root

ADD [ "assets/dosbox-0.74-2.tar.gz", "assets/dosbox-0.74.patch", "/build/" ]

RUN apk -U update \
    && apk add --no-cache sdl libxxf86vm libstdc++ libgcc build-base sdl-dev linux-headers file \
    && cd /build \
    && patch -p0 < dosbox-0.74.patch \
    && cd dosbox-0.74-2 \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && apk del build-base sdl-dev linux-headers \
    && rm -R /build 

ADD https://github.com/soothscier/assembly-nasm/raw/master/AFD.EXE /afd/AFD.EXE

# install fasm
RUN apk add --no-cache curl \
    && curl -sL "https://flatassembler.net/fasm-$FASM_VERSION.tgz" | tar xz \
    && ln -s /fasm/fasm /bin/fasm \
    && apk add --no-cache iverilog --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && mkdir /verilog \
    && chmod 777 /afd/AFD.EXE

# Openbox window manager update
COPY assets/menu.xml /etc/xdg/openbox/menu.xml

# Mounting the config and data directory
VOLUME  ["/dosbox", "/verilog"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]