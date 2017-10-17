#!/bin/bash -xe

# Clean
./clean.sh

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

# Customize JDK
jlink --module-path /Users/ynak/.sdkman/candidates/java/current/jmods:mlib --add-modules my.app --output myjdk --launcher myapp=my.app/my.app.HelloWorld

# Run as customized JDK
myjdk/bin/myapp
myjdk/bin/myapp FooBar

echo "Done."
