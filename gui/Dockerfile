FROM images.bits.chrsm.org/yaourt
LABEL maintainer="chrsm <c@chrsm.org>"

RUN yaourt -Syu --noconfirm --aur ttf-oxygen otf-overpass all-repository-fonts

USER c

CMD [ "/bin/bash" ]
