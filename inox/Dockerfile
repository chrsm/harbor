FROM pritunl/archlinux:latest
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm git sudo base-devel

RUN useradd -m -g users -G wheel c ; echo "c ALL=NOPASSWD: ALL" > /etc/sudoers.d/c

RUN sudo -u c sh -c \
	"git clone https://aur.archlinux.org/package-query.git /tmp/package-query ; cd /tmp/package-query ; yes|makepkg -si"
RUN sudo -u c sh -c \
	"git clone https://aur.archlinux.org/yaourt.git /tmp/yaourt ; cd /tmp/yaourt ; yes|makepkg -si"

RUN sudo -u c sh -c "yaourt -Syu --noconfirm --aur inox-bin"
RUN sudo -u c sh -c "yaourt -Syu --noconfirm --aur ttf-oxygen otf-overpass all-repository-fonts"

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo

USER c

CMD [ "/usr/bin/inox", "--user-data-dir=/data" ]
