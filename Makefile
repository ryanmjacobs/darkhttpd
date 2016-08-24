CC?=cc
CFLAGS?=-O
LIBS=`[ \`uname\` = "SunOS" ] && echo -lsocket -lnsl`
EXECUTABLE=darkhttpd_

all: darkhttpd

darkhttpd: darkhttpd.c
	$(CC) $(CFLAGS) $(LIBS) darkhttpd.c -o $(EXECUTABLE)

# builds a .deb package for debian users
# `make debian && dpkg -i darkhttpd.deb`
debian: darkhttpd
	mkdir -p ./darkhttpd/usr/bin
	mv $(EXECUTABLE) ./darkhttpd/usr/bin/darkhttpd
	cp -r DEBIAN ./darkhttpd
	dpkg-deb --build ./darkhttpd
	chmod +x darkhttpd.deb

# typical linux `make && make install`
install: darkhttpd
	install -Dm 775 $(EXECUTABLE) /usr/bin/$(EXECUTABLE)
uninstall:
	@rm -vf /usr/bin/$(EXECUTABLE)

clean:
	rm -rf $(EXECUTABLE) ./darkhttpd/

.PHONY: all clean debian darkhttpd
