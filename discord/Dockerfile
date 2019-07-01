FROM images.bits.chrsm.org/gui
LABEL maintainer="chrsm <c@chrsm.org>"

USER c
RUN yaourt -Syu --noconfirm --aur wget libxtst
RUN yaourt -Syu --noconfirm --aur discord
RUN yaourt -Syu --noconfirm libxtst

USER root
RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo

CMD [ "/usr/bin/discord" ]
