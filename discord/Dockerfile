FROM images.bits.chrsm.org/gui
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yaourt -Syu --noconfirm --aur wget libxtst
USER c
RUN cd /tmp ; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libc%2B%2B.tar.gz ; \
	tar xvfz libc++.tar.gz ; cd libc++; yes|makepkg -si --skipchecksums --skippgpcheck
USER root
RUN yaourt -Syu --noconfirm --aur discord
RUN yaourt -Syu --noconfirm libxtst

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/discord" ]
