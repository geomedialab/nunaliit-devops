#!/bin/sh
if [ -d "./nunaliit_old" ]; then
        echo "removing ./nunaliit_old"
        rm -rf nunaliit_old
fi

if [ -d "./nunaliit" ]; then
        echo "moving ./nunaliit to ./nunaliit_old"
        mv nunaliit nunaliit_old
fi

git clone https://github.com/GCRC/nunaliit.git uncompiled && \
cd uncompiled && \
git checkout branch-for-atlascine && \
mvn clean install && \

#after install, proceed with moving and unpacking executable
cp nunaliit2-couch-sdk/target/*.tar.gz ../ && \
cd .. && \
tar xf *.tar.gz --transform 's!^[^/]\+\($\|/\)!nunaliit\1!' && \
rm nunaliit_*.tar.gz && \
rm -rf uncompiled