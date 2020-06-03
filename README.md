# jessfraz-overlay

This overlay contains specific packages that jess wrote the ebuilds for
herself or has forked.

[![make shellcheck](https://github.com/jessfraz/jessfraz-overlay/workflows/make%20shellcheck/badge.svg)](https://github.com/jessfraz/jessfraz-overlay/actions?query=workflow%3A%22make+shellcheck%22+branch%3Amaster)
[![make test](https://github.com/jessfraz/jessfraz-overlay/workflows/make%20test/badge.svg)](https://github.com/jessfraz/jessfraz-overlay/actions?query=workflow%3A%22make+test%22+branch%3Amaster)

## TODO

- [ ] apparmor
- [ ] fwupd
- [ ] base layout
- [ ] speedtest CLI
- [ ] env var path to python gcloud
- [ ] static USE without breaking systemd
- [ ] use the hardened profile
- [ ] desktop package
- [ ] tests that try to install all the ebuilds
- [ ] cache the docker build to make it faster for CI
- [ ] go through all the USE flags individually for everything in base
- [ ] rebuild world again with new use flags after our files are copied in
- [ ] build custom kernel
- [ ] add dev ebuild with programming languages: go, rust, node, R, python
- [ ] script like in dockerfiles repo to check package versions when they are
      out of date
