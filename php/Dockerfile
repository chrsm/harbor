FROM images.bits.chrsm.org/arch
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm sudo php composer php-sqlite wget git

RUN sudo -u c bash -c 'composer g require psy/psysh:@stable ; \
	echo "export PATH=$PATH:/home/c/.composer/vendor/bin" >> /home/c/.bash_profile ; \
	mkdir -p /home/c/.local/share/psysh ; \
	wget http://psysh.org/manual/en/php_manual.sqlite -O /home/c/.local/share/psysh/php_manual.sqlite ; \
	echo "export PATH=$PATH:/home/c/.composer/vendor/bin" >> /home/c/.bashrc'

RUN echo -e "extension=pdo_sqlite.so\nextension=sqlite3.so" > /etc/php/conf.d/00-sqlite.ini

RUN pacman -Syu --noconfirm nano
RUN pacman -Syu --noconfirm openssh

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/php" ]
