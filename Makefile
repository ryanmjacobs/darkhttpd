CC?=cc
CFLAGS?=-Wall -O2
#LDFLAGS?=

all: bin

bin: darkhttpd
darkhttpd: darkhttpd.c
	rm -rf darkhttpd
	$(CC) $(CFLAGS) $(LDFLAGS) darkhttpd.c -o darkhttpd

# builds a .deb package for debian users
# `make debian && dpkg -i darkhttpd.deb`
deb: debian
debian: darkhttpd
	mv darkhttpd darkhttpd_
	mkdir -p ./darkhttpd/usr/bin
	mkdir -p ./darkhttpd/DEBIAN
	cp darkhttpd_ ./darkhttpd/usr/bin/darkhttpd
	cp control ./darkhttpd/DEBIAN/
	dpkg-deb --build ./darkhttpd
	rm -rf ./darkhttpd
	mv darkhttpd_ darkhttpd
	chmod +x darkhttpd.deb

# typical linux `make && make install`
install: darkhttpd
	install -Dm 775 darkhttpd /usr/bin/darkhttpd
uninstall:
	rm -vf /usr/bin/darkhttpd

clean:
	rm -rf darkhttpd darkhttpd.deb

.PHONY: clean
