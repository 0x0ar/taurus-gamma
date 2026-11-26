#!/bin/sh
# Lay out an installed taurus-gamma under $1 with the prefix /usr, from a release build.
# The release tarball is made from this tree.
set -eu
dest=${1:?usage: stage.sh DEST}
cd "$(dirname "$0")/.."

install -Dm755 target/release/taurus-gamma "$dest/usr/bin/taurus-gamma"
install -Dm644 assets/org.taurus.Gamma.service "$dest/usr/share/dbus-1/services/org.taurus.Gamma.service"
sed -i 's|@out@|/usr|' "$dest/usr/share/dbus-1/services/org.taurus.Gamma.service"
install -Dm644 LICENSE "$dest/usr/share/licenses/taurus-gamma/LICENSE"
