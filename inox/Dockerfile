FROM images.bits.chrsm.org/arch
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yaourt -Syu --noconfirm --aur inox-bin

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/inox", "--user-data-dir=/data" ]
