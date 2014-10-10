CC?=cc
CFLAGS?=-O
LIBS=`[ \`uname\` = "SunOS" ] && echo -lsocket -lnsl`
EXECUTABLE=darkhttpd

all: darkhttpd

darkhttpd: darkhttpd.c
	$(CC) $(CFLAGS) $(LIBS) darkhttpd.c -o $(EXECUTABLE)

debian: darkhttpd
	cd ..; dpkg-deb --build darkhttpd
	mv ../darkhttpd.deb .
	chmod +x darkhttpd.deb

install: darkhttpd
	install -Dm 775 $(EXECUTABLE) /usr/bin/$(EXECUTABLE)

uninstall:
	@rm -vf /usr/bin/$(EXECUTABLE)

clean:
	rm -f $(EXECUTABLE) darkhttpd core darkhttpd.core

.PHONY: all clean
