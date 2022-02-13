# Snap Nuke
This script nukes the snap package manager from Ubuntu.

**Disclaimer**: This has only been tested on Ubuntu 20.04 LTS, and may not work 
as intended on other versions. I will **NOT** be responsible for any damage if this
script breaks your pc.

**It also removes the GUI Ubuntu Store, this will be fixed in a future update.**

If you really want a snap-less Ubuntu that is guaranteed to not break,
you may want to try [Pop!_OS](https://pop.system76.com/) or [Linux Mint](https://linuxmint.com/)

If you are a server administrator, I highly advise against running this script, since it hasn't
been tested on Ubuntu Server. Please use Debian Testing instead. It's basically normal Debian but
the packages are more up to date. This is also what Ubuntu uses as a baseline to build on top of.

## Run the script
```bash
git clone https://github.com/grobo021/snap-nuke/
cd snap-nuke
./snap-nuke.sh
```

## Legal
This repository is under the [unlicense](LICENSE.txt) license. You are free to use this however you want,
but we are NOT providing any warranty that the script wont break the system. You have been warned.

## Todo
- [ ] Ubuntu 18.04 LTS Support
- [x] Ubuntu 20.04 LTS Support
- [ ] Ubuntu Server 20.04 LTS Support
- [ ] Fix GUI store removal
