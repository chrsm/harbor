FROM pritunl/archlinux:latest
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm thunderbird

RUN useradd -m -g users c

USER c

CMD [ "/usr/bin/thunderbird" ]
