FROM images.bits.chrsm.org/yaourt
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yaourt -Syu --noconfirm --aur ttf-oxygen otf-overpass all-repository-fonts wget libxtst
RUN cd /tmp ; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libc%2B%2B.tar.gz ; \
	tar xvfz libc++.tar.gz ; cd libc++; yes|makepkg -si --skipchecksums --skippgpcheck
RUN yaourt -Syu --noconfirm --aur discord
RUN yaourt -Syu --noconfirm libxtst

USER c

CMD [ "/usr/bin/discord" ]
