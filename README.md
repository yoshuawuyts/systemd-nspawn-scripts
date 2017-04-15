# systemd-nspawn-scripts
Various scripts to create images using `systemd-nspawn(1)`. Requires systemd
and a recent-ish kernel.

This is an experiment to create minimal containers on a Linux system. At Dat
we're building neato tools to package data, version and securely distribute
them over p2p networks. Being able to distribute applications using those tools
seems like a pretty cool idea.

## Usage
```sh
$ ./sync          # Sync the repo to <remote>:~/scripts
$ ./build-alpine  # Build Alpine Linux
$ ./build-node    # Build Node.js (run this in tmux, it takes a while)
```

## Todo
- [x] Have Alpine Linux working with `systemd-npawn(1)`
- [x] Have Node.js running in Alpine Linux
- [ ] Create script to format `/var/lib/machines` as btrfs
- [ ] Create unit file to run `systemd-nspawn(1)` container
- [ ] Validate logging & reboots inside host machine
- [ ] Create script to automate unit file creation
- [ ] Automate combining Alpine Linux + source dir + unit file into tar
- [ ] Automate unpacking source + unit into right locations on disk
- [ ] Create hyperdrive http server image
- [ ] Create boot script that automates creating http server image

## License
[MIT](https://tldrlegal.com/license/mit-license)
