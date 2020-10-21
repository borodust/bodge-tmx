# Install
BIN = libtmx

WORK_DIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

TMX_BUILD_DIR=$(WORK_DIR)/tmx/build

# Flags
ENV_CFLAGS := $(CFLAGS)
CFLAGS := $(ENV_CFLAGS) -std=c99 -pedantic -O2 -fPIC -I$(WORK_DIR)/tmx/src -I../ -L./


SRC = adapter.c
OBJ = $(SRC:.c=.o)
LIBS = -lm -ltmx -lxml2

ifeq ($(OS),Windows_NT)
	EXTENSION := dll
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		EXTENSION := dylib
	else
		EXTENSION := so
	endif
endif

BIN := $(BIN).$(EXTENSION).bodged

build: $(BIN)

$(BIN):
	mkdir -p $(TMX_BUILD_DIR)
	cd $(TMX_BUILD_DIR) && \
	cmake -G'Unix Makefiles' \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		$(BODGE_CMAKE_OPTS) .. \
	&& cmake --build . --config Release --clean-first
	cp -L $(TMX_BUILD_DIR)/libtmx.a $(WORK_DIR)
	$(CC) -shared $(SRC) $(CFLAGS) -o $(BIN) $(LIBS)

clean:
	rm -rf $(WORK_DIR)/*.a $(BIN) $(OBJS) $(TMX_BUILD_DIR)
