#!/bin/sh

xcopy \\\\fileserver02\\Library\\Gecko\\Firefox\\Firefox_3.6.22\\firefox-3.6.22.source.tar.bz2 .\\
#���L�̓����N�؂ꂷ�邽��Library�t�H���_�ɕۑ����������g���悤�ύX
#wget http://releases.mozilla.org/pub/mozilla.org/firefox/releases/3.6.16/source/firefox-3.6.16.source.tar.bz2
7z x *.tar.bz2
7z x *.tar
mv mozilla-1.* mozilla-central
./build_mozilla-central.sh >& log.txt