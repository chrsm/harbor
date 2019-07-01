FROM images.bits.chrsm.org/gui
LABEL maintainer="chrsm <c@chrsm.org>"

RUN sudo pacman -Syu --noconfirm vlc qt4 qtcurve-qt4

ENV QT_X11_NO_MITSHM 1 

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/vlc" ]
