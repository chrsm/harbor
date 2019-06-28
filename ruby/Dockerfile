FROM archlinux/base
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm ruby ruby-docs
RUN pacman -Syu --noconfirm git cvs mercurial base-devel

RUN useradd -m -g users c

USER c

CMD [ "/usr/bin/ruby" ]
