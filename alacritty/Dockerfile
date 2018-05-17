FROM pritunl/archlinux:latest

RUN pacman -Syu --noconfirm sudo cmake freetype2 fontconfig pkg-config make xclip git mesa libxi libxcursor ttf-fira-mono

RUN useradd -m -g users c

RUN pacman -Syu --noconfirm base-devel

RUN sudo -u c bash -c "curl https://sh.rustup.rs -sSf | sh -s -- -y ; \
	/home/c/.cargo/bin/rustup override set stable ; /home/c/.cargo/bin/rustup update stable; \
	git clone https://github.com/jwilm/alacritty.git /home/c/alacritty ; \
	cd /home/c/alacritty ; \
	/home/c/.cargo/bin/cargo build --release"

USER c
CMD [ "/home/c/alacritty/target/release/alacritty" ]
