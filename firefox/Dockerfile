FROM c/gui_base
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yes | gpg --recv-key 0x61B7B526D98F0353
RUN yaourt -Syu --aur --noconfirm firefox-nightly
RUN yaourt -Syu --noconfirm libpulse gstreamer gst-libav gst-plugins-bad gst-plugins-base \
	gst-plugins-good gs-plugins-ugly \
	gst-plugin-libde265 gstreamer-vaapi

RUN sudo -u root sh -c "usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo"

USER c
CMD [ "/usr/bin/firefox-nightly" ]
