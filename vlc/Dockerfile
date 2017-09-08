FROM pritunl/archlinux:latest
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm vlc qt4 qtcurve-qt4 cantarell-fonts
RUN useradd -m -g users c
COPY pulse-client.conf /etc/pulse/client.conf

ENV QT_X11_NO_MITSHM 1 

USER c

CMD [ "/usr/bin/vlc" ]
