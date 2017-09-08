#!/usr/bin/env zsh

docker_run(){
	local container=$1
	local desired_opts=$2
	local def_override=$3
	local extra=$4
	local run_opts=""

	# I'm not positive --privileged is needed in all cases
	GFX_OPTS="-v /dev/dri:/dev/dri \
		--privileged \
		--group-add video"

	X_OPTS="-e DISPLAY \
		-e XAUTHORITY \
		-v $XAUTHORITY:$XAUTHORITY \
		-v /tmp/.X11-unix:/tmp/.X11-unix"

	SOUND_OPTS="--device /dev/snd \
		-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
		-v $XDG_RUNTIME_DIR/pulse/native:$XDG_RUNTIME_DIR/pulse/native \
		-v $HOME/.pulse:$HOME/.pulse \
		--group-add audio"

	DEFAULT_OPTS="--hostname=zzz \
		--net=host \
		-v /etc/hosts:/etc/hosts:ro \
		-v /etc/localtime:/etc/localtime:ro"

	# $1 = desired options (GFX, X, SOUND)
	# $2 = image to run a container from
	# $3 = DEFAULT_OPTS override
	local desired_opt

	run_opts=""
	setopt shwordsplit
	for desired_opt in $desired_opts
	do
		case "$desired_opt" in
			"GFX")
				run_opts="$run_opts $GFX_OPTS "
				;;
			"X")
				run_opts="$run_opts $X_OPTS "
				;;
			"SOUND")
				run_opts="$run_opts $SOUND_OPTS "
				;;
		esac
	done

	if [[ -z "$def_override" ]]; then
		run_opts="$DEFAULT_OPTS $run_opts"
	else
		run_opts="$def_override $run_opts"
	fi

	echo "docker run $run_opts $extra $container"
}

docker_inox(){
	local container="c/inox"
	local overrides=""
	local wants="GFX X SOUND"
	local extra="-v $HOME/downloads:$HOME/downloads \
		-v $HOME/.config/inox:$HOME/.config/inox \
		-v $HOME/.inoxunpack:$HOME/.inoxunpack \
		--security-opt seccomp:$HOME/.local/custom/chrome-seccomp.json \
		-d --rm \
		--name inox-personal"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

open_in_docker_inox(){
	local running=$(docker inspect --format "{{.State.Running}}" inox-personal 2>/dev/null)

	if [[ "$running" == "true" ]]; then
		docker exec -i inox-personal inox "$@" 2>/dev/null
	else
		# start it, and then run another inox cmd in the container with that page
		docker_inox

		if [ "$@" != "" ]; then
			docker exec -d inox-personal inox "$@" 2>/dev/null
		fi
	fi
}

docker_inox_private(){
	local container="c/inox"
	local overrides=""
	local wants="GFX X SOUND"
	local extra="-v $HOME/downloads:$HOME/downloads \
		--security-opt seccomp:$HOME/.local/custom/chrome-seccomp.json \
		-i --rm --memory 2gb --cpuset-cpus 0 \
		--name inox-private"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra") /usr/bin/inox --incognito
}

docker_thunderbird(){
	local container="c/thunderbird"
	local overrides=""
	local wants="X"
	local extra="-v $HOME/.thunderbird:$HOME/.thunderbird \
		-v $HOME/.cache/thunderbird:$HOME/.cache/thunderbird \
		-v $HOME/downloads:$HOME/downloads \
		--name thunderbird \
		-i --rm --cpuset-cpus 1 --memory 1gb"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

docker_vlc(){
	local container="c/vlc"
	local overrides=""
	local wants="X SOUND"
	local extra="-v $HOME/.config/vlc:$HOME/.config/vlc \
		-v $HOME/downloads:$HOME/downloads \
		--name vlc \
		-i --rm --memory 1gb"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

docker_evince(){
	local container="c/evince"
	local overrides=""
	local wants="X"
	local extra="-v $HOME/downloads:$HOME/downloads \
		--name evince \
		-i --rm"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

docker_slack(){
	local container="c/slack-desktop"
	local overrides=""
	local wants="X SOUND"
	local extra="-v $HOME/.config/slack:$HOME/.config/Slack \
		--name slack-work \
		-i --rm \
		--memory 1gb \
		--ipc=host"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

docker_deluge(){
	local container="c/deluge"
	local overrides=""
	local wants="X"
	local extra="-v $HOME/downloads:$HOME/downloads \
		-v $HOME/.config/deluge:$HOME/.config/deluge \
		--name deluge \
		-i --rm \
		--memory 500mb"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

docker_tig(){
	# find the .git dir by walking up the chain until we get it
	GITROOT=$(git rev-parse --show-toplevel)

	# where are we relative to that in our new layout?
	DIR=$(pwd | sed -e "s#${GITROOT}##g")

	if [[ -z "$@" ]]; then
		docker run -it --rm \
			-v /etc/localtime:/etc/localtime \
			-v $GITROOT:/opt/host \
			-w /opt/host$DIR \
			c/tig
	else
		docker run -it --rm \
			-v /etc/localtime:/etc/localtime \
			-v $GITROOT:/opt/host \
			-w /opt/host$DIR \
			c/tig tig $@
	fi
}

docker_php(){
	docker run -it \
		--rm \
		-v /etc/localtime:/etc/localtime \
		-v $(pwd):/opt/host \
		-w /opt/host \
		c/php \
		php $1
}

docker_prepl(){
	docker run -it \
		--rm \
		-v /etc/localtime:/etc/localtime \
		-v $HOME/.config/psysh:$HOME/.config/psysh \
		-v $(pwd):/opt/host \
		-w /opt/host \
		c/php \
		/home/c/.composer/vendor/bin/psysh
}

docker_arcanist(){
	# find the .git dir by walking up the chain until we get it
	GITROOT=$(git rev-parse --show-toplevel)

	# where are we relative to that in our new layout?
	DIR=$(pwd | sed -e "s#${GITROOT}##g")

	docker run -it \
		--rm \
		-v $HOME/.gitconfig:$HOME/.gitconfig \
		-v $HOME/.ssh:$HOME/.ssh \
		-v $HOME/.arcrc:$HOME/.arcrc \
		-v /etc/localtime:/etc/localtime \
		-v $GITROOT:/opt/host \
		-w /opt/host$DIR \
		c/arcanist \
		/home/c/.arc/arcanist/bin/arc $1
}

docker_mopidy(){
	local container="c/mopidy"
	local overrides=""
	local wants="SOUND"
	local extra="-v $HOME/.config/mopidy:$HOME/.config/mopidy \
		--name mopidy \
		-d --rm \
		-p 127.0.0.1:6600:6600 \
		-p 127.0.0.1:6680:6680 \
		--memory 500mb"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

docker_firefox(){
	local container="c/firefox"
	local overrides=""
	local wants="X SOUND GFX"
	local extra="-v $HOME/.mozilla:$HOME/.mozilla \
		--name firefox \
		--memory 1gb \
		-i --rm"

	eval $(docker_run "$container" "$wants" "$overrids" "$extra")
}

docker_alacritty(){
	local container="c/alacritty"
	local overrides=""
	local wants="X GFX"
	local extra="-v $HOME/downloads:$HOME/downloads \
		-v $HOME/.config/alacritty:$HOME/.config/alacritty \
		-v /dev/shm:/dev/shm \
		-i --rm \
		--name alacritty"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}
