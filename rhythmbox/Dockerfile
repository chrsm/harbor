FROM images.bits.chrsm.org/gui
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm git sudo base-devel

RUN sudo -u c sh -c \
	"git clone https://aur.archlinux.org/package-query.git /tmp/package-query ; cd /tmp/package-query ; yes|makepkg -si"
RUN sudo -u c sh -c \
	"git clone https://aur.archlinux.org/yaourt.git /tmp/yaourt ; cd /tmp/yaourt ; yes|makepkg -si"

RUN sudo -u c sh -c "yaourt -Syu --noconfirm --aur rhythmbox"
RUN sudo -u c sh -c "yaourt -Syu --noconfirm --aur ttf-oxygen"
RUN sudo -u c sh -c "yaourt -Syu --noconfirm gst-plugins-ugly gst-libav gst-plugins-bad"

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c

CMD [ "/usr/bin/rhythmbox" ]
