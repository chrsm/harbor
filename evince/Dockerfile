FROM c/gui_base
LABEL maintainer="chrsm <c@chrsm.org>"

RUN sudo pacman -Syu --noconfirm evince

USER c
CMD [ "/usr/bin/evince" ]
