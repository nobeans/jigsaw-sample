#!/bin/bash -xe

find . -name "*.class" | xargs rm
find mods -name "*.jar" | xargs rm

find . -name "*.java" | xargs javac

java -cp src/main/java my.HelloWorld
java -cp src/main/java my.HelloWorld FooBar

mkdir -p mods
jar --create --file mods/my-app.jar --main-class my.HelloWorld -C src/main/java .

java -jar my-app.jar
java -jar my-app.jar FooBar
