#!/bin/bash -xe

# Clean
find . -name "*.class" | xargs rm
find mods -name "*.jar" | xargs rm

# Compile class using module
mkdir -p mods
find src/my-lib -name "*.java" | xargs javac -d mods/my.lib
find src/my-app -name "*.java" | xargs javac --module-path mods -d mods/my.app

# Run class using module
java -p mods -m my.app/my.app.HelloWorld
java -p mods -m my.app/my.app.HelloWorld FooBar

# Package modules
mkdir -p mlib
jar --create --file mlib/my-lib.jar -C mods/my.lib .
jar --create --file mlib/my-app.jar --main-class my.app.HelloWorld -C mods/my.app .

# Run as module jar
java -p mlib -m my.app
java -p mlib -m my.app FooBar

echo "Done."
