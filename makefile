CC ?= cc
INCLUDE_HEADERS = 
LINK_DEPS = -lSDL2
CFLAGS ?= -Ofast
LDFLAGS = -lm
PRJ_NAME = borg

ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

ifneq ($(LDFLAGS),)
LINK_DEPS += $(LDFLAGS)
endif

all:
	$(CC) $(CFLAGS) $(LDFLAGS) main.c $(INCLUDE_HEADERS) $(LINK_DEPS) -o $(PRJ_NAME)

install:
	install -Dm 0755 $(PRJ_NAME) -t $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PRJ_NAME)

clean:
	rm -f $(PRJ_NAME)
