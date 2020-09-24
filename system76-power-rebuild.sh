#!/bin/bash -ex

DEB_VERSION="$(dpkg-parsechangelog -S Version)"
debuild -b -uc -us
sudo dpkg -i "../system76-power_${DEB_VERSION}_amd64.deb"
