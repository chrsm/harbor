FROM archlinux/base
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm luajit luarocks5.1
RUN pacman -Syu --noconfirm git cvs mercurial cmake lua51-sec base-devel

RUN useradd -m -g users c

USER c

CMD [ "/usr/bin/luajit" ]
