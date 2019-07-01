FROM images.bits.chrsm.org/php
LABEL maintainer="chrsm <c@chrsm.org>"

RUN echo "export PATH=\$PATH:/home/c/.arc/arcanist/bin" >> /home/c/.bashrc ; \
	mkdir /home/c/.arc ; \
	git clone https://github.com/phacility/libphutil.git /home/c/.arc/libphutil ; \
	git clone https://github.com/phacility/arcanist.git /home/c/.arc/arcanist

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/home/c/.arc/arcanist/bin/arc" ]
