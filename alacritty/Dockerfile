FROM images.bits.chrsm.org/gui

RUN pacman -Syu --noconfirm sudo cmake freetype2 fontconfig pkg-config make xclip git mesa libxi libxcursor

RUN sudo -u c bash -c "curl https://sh.rustup.rs -sSf | sh -s -- -y ; \
	/home/c/.cargo/bin/rustup override set stable ; /home/c/.cargo/bin/rustup update stable; \
	git clone https://github.com/jwilm/alacritty.git /home/c/alacritty ; \
	cd /home/c/alacritty ; \
	/home/c/.cargo/bin/cargo build --release"

RUN usermod -G '' c ; rm /etc/sudoers.d/c ; pacman -R --noconfirm sudo
USER c
CMD [ "/home/c/alacritty/target/release/alacritty" ]
