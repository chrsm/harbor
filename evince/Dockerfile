FROM pritunl/archlinux:latest
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm evince
RUN useradd -m -g users c

USER c
CMD [ "/usr/bin/evince" ]
