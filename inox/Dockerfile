FROM images.bits.chrsm.org/yaourt
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yaourt -Syu --noconfirm --aur inox-bin
RUN yaourt -Syu --noconfirm --aur ttf-oxygen otf-overpass all-repository-fonts

RUN sudo -u root sh -c "usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo"

USER c

CMD [ "/usr/bin/inox", "--user-data-dir=/data" ]
