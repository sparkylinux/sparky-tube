#!/bin/sh
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA

if [ "$1" = "uninstall" ]; then
	rm -f /usr/bin/sparky-tube
	rm -f /usr/share/applications/sparky-tube.desktop
	rm -rf /usr/share/sparky/sparky-tube
	rm -f /usr/share/pixmaps/sparky-tube.png
else
	cp bin/* /usr/bin/
	cp share/* /usr/share/applications/
	if [ ! -d /usr/share/sparky/sparky-tube ]; then
		mkdir -p /usr/share/sparky/sparky-tube
	fi
	cp lang/* /usr/share/sparky/sparky-tube/
	cp pixmaps/* /usr/share/pixmaps/
fi
