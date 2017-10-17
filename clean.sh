#!/bin/bash -xe

# Clean
find . -name "*.class" | xargs rm
find mods -name "*.jar" | xargs rm
rm -rf mods
rm -rf mlib
rm -rf myjdk

echo "Done."
