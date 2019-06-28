FROM archlinux/base
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm rxvt-unicode urxvt-perls
RUN useradd -m -g users c

USER c
CMD [ "/usr/bin/urxvt" ]
