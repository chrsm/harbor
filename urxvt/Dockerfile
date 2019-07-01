FROM images.bits.chrsm.org/gui
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm rxvt-unicode urxvt-perls

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c
CMD [ "/usr/bin/urxvt" ]
