CC=gcc
CFLAGS=-Wall -Wextra
LDLIBS=-lm -lsndfile

ifeq ($(LAME),1)
  LDFLAGS+=-lmp3lame
  CFLAGS+=-DHAVE_LAME=1
endif

ifeq ($(DEBUG),1)
  LDFLAGS+=-ggdb
  CFLAGS+=-ggdb
endif

all: hamunki_cwwav

clean:
	rm -f hamunki_cwwav

install: all
	install -d /usr/local/bin
	install -m 0755 hamunki_cwwav /usr/local/bin/hamunki_cwwav
