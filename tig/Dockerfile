FROM archlinux/base
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm tig

RUN useradd -m -g users c

USER c

CMD [ "/usr/bin/tig" ]
