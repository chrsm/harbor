FROM c/yaourt
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yes | gpg --recv-key 0x61B7B526D98F0353
RUN yaourt -Syu --aur --noconfirm firefox-nightly
RUN yaourt -Syu --noconfirm libpulse

USER c
CMD [ "/usr/bin/firefox-nightly" ]
