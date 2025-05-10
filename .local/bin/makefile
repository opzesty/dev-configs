# Makefile

ROOT_DIR := $(shell git rev-parse --show-toplevel)
BIN_DIR := $(HOME)/.local/bin
SCREENSHOT_SCRIPT := $(ROOT_DIR)/.local/bin/screenshot.sh
PICTURES_DIR := $(HOME)/Pictures/Screenshots

install: $(BIN_DIR)/screenshot.sh

$(BIN_DIR)/screenshot.sh: $(SCREENSHOT_SCRIPT)
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(PICTURES_DIR)
	@install -m 755 $(SCREENSHOT_SCRIPT) $(BIN_DIR)/screenshot.sh
	@echo "Installed screenshot.sh and ensured screenshot directory exists."
