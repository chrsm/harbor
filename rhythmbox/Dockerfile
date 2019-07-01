FROM images.bits.chrsm.org/gui
LABEL maintainer="chrsm <c@chrsm.org>"

RUN sudo -u c sh -c "yaourt -Syu --noconfirm --aur rhythmbox"
RUN sudo -u c sh -c "yaourt -Syu --noconfirm gst-plugins-ugly gst-libav gst-plugins-bad"

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/rhythmbox" ]
