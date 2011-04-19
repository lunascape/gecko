#!/bin/sh

cp -f ./mozconfig ./mozilla-central/.mozconfig
cp -f ./profile_pgo.sh ./mozilla-build/msys/home/profile_pgo.sh
cp -r -f ./patch/mozilla-central .

cd ./mozilla-central

make -f client.mk clean
make -f client.mk profiledbuild

#make -f client.mk build

#cd ../output/embedding/browser/activex/src/control
#make

#cd ../control_kicker
#make

#cd ../../../../../..

echo "Done"

exit 0