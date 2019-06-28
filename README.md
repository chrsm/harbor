the harbor
======

_Note:_ These are not meant to be used by other people directly. Most of these
images end up containing my `$USER` and paths, though I've tried to keep
configs out of the images themselves where appropriate. If anything, the
scripts in `bin/` may be useful to someone attempting to accomplish a similar
goal.

As a Linux user who sometimes has to work on other OSes, I try to dockerize
what I can. Harbor contains Dockerfiles for the tools I use on a regular basis.

All images are based on `archlinux/base` (previously `pritunl/archlinux`).

Some GUI apps are contained as well, but HW acceleration and sound do not work
outside of Docker running natively on Linux.


TODOs
=====

- Research hw accel on mac - possible at all?
- Update base - creating `$USER` in too many places.
