#!/bin/bash

if [ -d "./nunaliit_old" ]; then
        echo "Removing ./nunaliit_old"
        rm -rf nunaliit_old
fi

if [ -d "./nunaliit" ]; then
        echo "Moving ./nunaliit to ./nunaliit_old"
        mv nunaliit nunaliit_old
fi

git clone https://github.com/GCRC/nunaliit.git uncompiled_repo && \
cd uncompiled_repo && \
git checkout branch-for-atlascine && \
mvn clean install && \

cp nunaliit2-couch-sdk/target/*.tar.gz ../ && \
cd .. && \
tar xf *.tar.gz --transform 's!^[^/]\+\($\|/\)!nunaliit\1!' && \
rm -f nunaliit_*.tar.gz && \
rm -rf uncompiled_repo
