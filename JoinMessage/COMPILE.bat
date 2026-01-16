@echo off
chcp 65001 >nul
echo ========================================
echo   JoinMessage - Build Script
echo ========================================
echo.

set JAVA_HOME=C:\Program Files\Eclipse Foundation\jdk-16.0.2.7-hotspot
set PATH=%JAVA_HOME%\bin;%PATH%

if not exist build mkdir build
if not exist build\classes mkdir build\classes
if not exist target mkdir target

if not exist build\spigot-api.jar (
    echo Spigot API not found. Trying to download...
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://download.getbukkit.org/spigot/spigot-api-1.16.5-R0.1-SNAPSHOT-shaded.jar' -OutFile 'build\spigot-api.jar'" 2>nul
)

if not exist build\spigot-api.jar (
    echo.
    echo ========================================
    echo   MANUAL DOWNLOAD REQUIRED
    echo ========================================
    echo.
    echo Download Spigot API from one of these:
    echo   - https://getbukkit.org/download/spigot
    echo   - https://hub.spigotmc.org/nexus/
    echo.
    echo Put the JAR file in: build\spigot-api.jar
    echo Then run this script again.
    echo.
    pause
    exit /b 1
)

echo Compiling...
javac -cp "build\spigot-api.jar" -d build\classes src\main\java\com\joinmessage\JoinMessage.java

if %errorlevel% neq 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

copy src\main\resources\plugin.yml build\classes\ >nul
copy src\main\resources\config.yml build\classes\ >nul

cd build\classes
jar cvf JoinMessage.jar com\joinmessage\*.class plugin.yml config.yml >nul
cd ..\..

move /Y build\classes\JoinMessage.jar target\JoinMessage.jar >nul

echo.
echo ========================================
echo   BUILD SUCCESSFUL!
echo ========================================
echo Output: target\JoinMessage.jar
pause
