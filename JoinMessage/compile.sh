#!/bin/bash

echo "========================================"
echo "  JoinMessage - Build Script"
echo "========================================"

mkdir -p build/classes target

if [ ! -f "build/spigot-api.jar" ]; then
    echo "Downloading Spigot API 1.16.5..."
    curl -L -o build/spigot-api.jar "https://hub.spigotmc.org/nexus/content/repositories/snapshots/org/spigotmc/spigot-api/1.16.5-R0.1-SNAPSHOT/spigot-api-1.16.5-R0.1-20210119.001102-143.jar" 2>/dev/null
fi

echo "Compiling..."
javac -cp "build/spigot-api.jar" -d build/classes src/main/java/com/joinmessage/JoinMessage.java

if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    exit 1
fi

cp src/main/resources/plugin.yml build/classes/
cp src/main/resources/config.yml build/classes/

cd build/classes
jar cvf JoinMessage.jar com/joinmessage/*.class plugin.yml config.yml >/dev/null
cd ../..

mv build/classes/JoinMessage.jar target/JoinMessage.jar

echo ""
echo "========================================"
echo "  BUILD SUCCESSFUL!"
echo "========================================"
echo "Output: target/JoinMessage.jar"
