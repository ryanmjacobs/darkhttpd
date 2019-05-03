# darkhttpd

(forked from https://unix4lyfe.org/git/darkhttpd)

### If you're here for a Ubuntu/Debian package...

You can grab it here: https://github.com/ryanmjacobs/darkhttpd/releases/download/r2/darkhttpd-x86_64.deb
```console
$ curl -O https://github.com/ryanmjacobs/darkhttpd/releases/download/r2/darkhttpd-x86_64.deb
$ dpkg -i darkhttpd-x86_64.deb
```

### Now with HTTP Basic-Auth support

```
Usage: darkhttpd . --auth username:password
       darkhttpd . --port 8080 --auth john:pass123
```

## How to build darkhttpd

Simply run:
```console
$ make bin    # produces native binary only
$ make debian # will produce a .deb package too
```

To install:
```
$ sudo make install           # distro-independent
$ sudo dpkg -i darkhttpd.deb  # for Debian-based distros, e.g. Ubuntu
```

## Usage

See the full usage by running `darkhttpd --help`.

## Release Versions

This section documents what package/binaries I have compiled and uploaded to
Github Releases.

* r2 (2019-04-10):
  * compiled and statically linked to musl for better compatibility
  * CC=musl-gcc LDFLAGS=-static make deb
* r1 (2019-04-10):
  * compiled and uploaded 64-bit .deb package
  * git hash d7501ec on master branch
