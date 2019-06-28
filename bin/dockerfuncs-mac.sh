#!/usr/bin/env zsh

docker_run(){
	local container=$1
	local desired_opts=$2
	local def_override=$3
	local extra=$4
	local run_opts=""

	local ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

	# docker for mac doesn't support gpu passthrough as far as i can tell,
	# since it uses an xhyve vm..need to look in to this at some point
	GFX_OPTS=""

	X_OPTS="-e DISPLAY=$ip:0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix"

	# another thing to figure out at some point: sound
	SOUND_OPTS=""

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
		-v $HOME/Downloads:$HOME/Downloads \
		--name vlc \
		-i --rm --memory 1gb"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}

docker_evince(){
	local container="c/evince"
	local overrides=""
	local wants="X"
	local extra="-v $HOME/Downloads:$HOME/Downloads \
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
	local extra="-v $HOME/Downloads:$HOME/Downloads \
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
		$HOME/.composer/vendor/bin/psysh
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
		-i --rm \
		--name alacritty"

	eval $(docker_run "$container" "$wants" "$overrides" "$extra")
}
