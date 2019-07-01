FROM images.bits.chrsm.org/arch
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm luajit luarocks5.1
RUN pacman -Syu --noconfirm cvs mercurial cmake lua51-sec

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/luajit" ]
