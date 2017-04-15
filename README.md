# systemd-nspawn-scripts
Various scripts to create images using systemd nspawn. Requires systemd and
a recent-ish kernel.

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

## License
[MIT](https://tldrlegal.com/license/mit-license)
