# systemd-nspawn-scripts
Various scripts to create images using `systemd-nspawn(1)`. Requires systemd
and a recent-ish kernel.

This is an experiment to create minimal containers on a Linux system. At Dat
we're building neato tools to package data, version and securely distribute
them over p2p networks. Being able to distribute applications using those tools
seems like a pretty cool idea.

## Usage
```sh
# setup computer
$ ./sync          # Sync the repo to <remote>:~/scripts
$ ./swap          # Create a swap file, needed to build Node on small boxes

# stuff if you're gonna do raw systemd-nspawn (not recommended, but fun)
$ ./btrfs         # Format /var/lib/machines as btrfs
$ ./build-alpine  # Build Alpine Linux
$ ./build-node    # Build Node.js (run this in tmux, it takes a while)

# stuff if you wanna do rkt based stuff (recommended)
$ ./rkt                 # Install rkt & acbuild
$ ./build-node-image    # Build a local node test container
$ ./build-from-git      # Pull & build a git repo that has a ./build.sh script
```

## Todo
- [x] Have Alpine Linux working with `systemd-npawn(1)`
- [x] Automate swap file creation
- [x] Have Node.js running in Alpine Linux
- [x] Create script to format `/var/lib/machines` as btrfs
- [x] Update Alpine & Node to be copy-on-write images inside `/var/lib/machines`
- [ ] Create unit file to run `systemd-nspawn(1)` container
- [x] Validate logging & reboots inside host machine
- [ ] Create script to automate unit file creation
- [x] Automate combining Alpine Linux + source dir + unit file into tar
- [x] Automate unpacking source + unit into right locations on disk
- [ ] Create hyperdrive http server image
- [ ] Create boot script that automates creating http server image

## See Also
- https://github.com/containers/build
- https://coreos.com/rkt/docs/latest/running-docker-images.html

## License
[MIT](https://tldrlegal.com/license/mit-license)
