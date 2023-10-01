# set makefile default
.DEFAULT_GOAL := help
.PHONY: help install config home

CONFIG_SRC = $(wildcard config/*)

# help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  help			Show this help message"
	@echo "  install		Install config and home files"
	@echo "  config		Install config files"
	@echo "  home			Install home files"

install: config home

# copy home files to home
home:
	@echo "Copying home files..."
	cp -r home/.zshrc $(HOME)/
	cp -r home/.zprofile $(HOME)/
	cp -r home/.Xresources $(HOME)/
	@echo "Done!"

# copy CONFIG_SRC to home config
config:
	@echo "Copying config files..."
	for C_SRC in $(CONFIG_SRC); do \
		cp -r $$C_SRC $(HOME)/.config/; \
	done
	@echo "Done!"
# configure font rendering
	@echo "configure font"
	@mkdir -p $(HOME)/.config/fontconfig/conf.d
	@ln -sf /usr/share/fontconfig/conf.avail/10-hinting-slight.conf $(HOME)/.config/fontconfig/conf.d
# setup color scheme
	@cp /usr/share/color-schemes/BreezeDark.colors ~/.config/kdeglobals


wallpaper:
	@echo "Copying wallpaper..."
	@mkdir -p $(HOME)/.wallpapers
	@cp -r wallpapers/* $(HOME)/.wallpapers/
	@echo "Done!"