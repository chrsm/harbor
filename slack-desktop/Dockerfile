FROM c/yaourt
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yaourt -Syu --noconfirm --aur slack-desktop cantarell-fonts

RUN sudo -u root sh -c "usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo"

USER c

CMD [ "/usr/bin/slack" ]
