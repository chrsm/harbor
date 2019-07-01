#!/bin/bash

yes|docker system prune -a

cd harbor
git fetch --all && git pull

cd arch && docker build --no-cache -t images.bits.chrsm.org/arch . && docker push images.bits.chrsm.org/arch
cd ..
cd gui && docker build -t images.bits.chrsm.org/gui . && docker push images.bits.chrsm.org/gui
cd ..

for d in ./*
do
	[[ ! -d "$d" ]] && continue

	img=$(basename $d)
	[[ $img =~ ^(arch|gui|\.|\.\.)$ ]] && continue

	echo "building $img"
	cd $img
	docker build -t images.bits.chrsm.org/$img .
	docker push images.bits.chrsm.org/$img
	cd ..
done
