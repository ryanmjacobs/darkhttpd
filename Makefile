CC?=cc
CFLAGS?=-O
LIBS=`[ \`uname\` = "SunOS" ] && echo -lsocket -lnsl`
EXECUTABLE=darkhttpd

all: darkhttpd

darkhttpd: darkhttpd.c
	$(CC) $(CFLAGS) $(LIBS) darkhttpd.c -o $(EXECUTABLE)

debian: darkhttpd
	mkdir -p usr/bin
	mv $(EXECUTABLE) usr/bin/
	cd ..; dpkg-deb --build darkhttpd; chmod +x darkhttpd.deb
	mv ../darkhttpd.deb .

install: darkhttpd
	install -Dm 775 $(EXECUTABLE) /usr/bin/$(EXECUTABLE)

uninstall:
	@rm -vf /usr/bin/$(EXECUTABLE)

clean:
	rm -f $(EXECUTABLE)

.PHONY: all clean
