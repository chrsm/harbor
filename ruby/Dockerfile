FROM images.bits.chrsm.org/arch
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm ruby ruby-docs
RUN pacman -Syu --noconfirm cvs mercurial

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/ruby" ]
