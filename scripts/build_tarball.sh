#!/bin/bash

VERSION=$(grep -o '".*"' version.sbt | tr -d '"')
SCIO=scio-$VERSION

mkdir -p $SCIO/bin
mkdir -p $SCIO/libexec

sbt "project scio-repl" clean assembly
cp scripts/scio-repl $SCIO/bin
mv scio-repl/target/scala-2.11/scio-repl-$VERSION.jar $SCIO/libexec

tar czf $SCIO.tar.gz $SCIO
