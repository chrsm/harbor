FROM archlinux/base
LABEL maintainer="chrsm <c@chrsm.org>"

RUN pacman -Syu --noconfirm git sudo base-devel

RUN useradd -m -g users -G wheel c ; echo "c ALL=NOPASSWD: ALL" > /etc/sudoers.d/c

RUN sudo -u c sh -c \
	"git clone https://aur.archlinux.org/package-query.git /tmp/package-query ; cd /tmp/package-query ; yes|makepkg -si"
RUN sudo -u c sh -c \
	"git clone https://aur.archlinux.org/yaourt.git /tmp/yaourt ; cd /tmp/yaourt ; yes|makepkg -si"

# RUN THIS AFTER ANY OTHER DOCKER FILE!
# RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo

USER c

CMD [ "bash" ]
