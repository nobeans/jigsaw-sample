#!/bin/bash -xe

find . -name "*.class" | xargs rm

find . -name "*.java" | xargs javac

java -cp src/main/java my.HelloWorld
java -cp src/main/java my.HelloWorld FooBar
