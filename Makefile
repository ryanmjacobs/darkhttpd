CC?=cc
CFLAGS?=-O
LIBS=`[ \`uname\` = "SunOS" ] && echo -lsocket -lnsl`
EXECUTABLE=darkhttpd

all: darkhttpd

darkhttpd: darkhttpd.c
	rm -rf darkhttpd
	$(CC) $(CFLAGS) $(LIBS) darkhttpd.c -o $(EXECUTABLE)

# builds a .deb package for debian users
# `make debian && dpkg -i darkhttpd.deb`
deb: debian
debian: darkhttpd
	mv $(EXECUTABLE) $(EXECUTABLE)_
	mkdir -p ./darkhttpd/usr/bin
	mkdir -p ./darkhttpd/DEBIAN
	mv $(EXECUTABLE)_ ./darkhttpd/usr/bin/darkhttpd
	cp control ./darkhttpd/DEBIAN/
	dpkg-deb --build ./darkhttpd
	rm -rf ./darkhttpd
	chmod +x darkhttpd.deb

# typical linux `make && make install`
install: darkhttpd
	install -Dm 775 $(EXECUTABLE) /usr/bin/$(EXECUTABLE)
uninstall:
	@rm -vf /usr/bin/$(EXECUTABLE)

clean:
	rm -rf $(EXECUTABLE) darkhttpd.deb ./darkhttpd/

.PHONY: all clean debian darkhttpd
