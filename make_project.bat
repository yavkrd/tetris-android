@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo   TETRIS-ANDROID PROJECT BUILD (BAT)
echo ==========================================
echo.
echo Current folder: %CD%
echo.

:: === STEP 1: Create all folders in one loop ===
echo [STEP 1/2] Creating directories...
set "dirs=.github .github\workflows app app\src app\src\main app\src\main\res app\src\main\res\values app\src\main\java\com\example\tetris"
set "fcount=0"
for %%d in (%dirs%) do (
    if not exist "%%d" (
        mkdir "%%d"
        set /a fcount+=1
        echo   + %%d
    ) else (
        echo   . %%d [exists]
    )
)
echo   New folders: !fcount!
echo.

:: === STEP 2: Write all files ===
echo [STEP 2/2] Writing project files...
set "fc=0"
set "err=0"

:: Helper: write file and check
call :write "gradle.properties"
>>"gradle.properties" echo org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
>>"gradle.properties" echo android.useAndroidX=true
call :chk "gradle.properties"

call :write "settings.gradle"
>>"settings.gradle" echo rootProject.name = "tetris-android"
>>"settings.gradle" echo include ':app'
call :chk "settings.gradle"

call :write "app\build.gradle"
>>"app\build.gradle" echo plugins {
>>"app\build.gradle" echo     id 'com.android.application'
>>"app\build.gradle" echo }
>>"app\build.gradle" echo.
>>"app\build.gradle" echo android {
>>"app\build.gradle" echo     namespace 'com.example.tetris'
>>"app\build.gradle" echo     compileSdk 34
>>"app\build.gradle" echo.
>>"app\build.gradle" echo     defaultConfig {
>>"app\build.gradle" echo         applicationId "com.example.tetris"
>>"app\build.gradle" echo         minSdk 24
>>"app\build.gradle" echo         targetSdk 34
>>"app\build.gradle" echo         versionCode 1
>>"app\build.gradle" echo         versionName "1.0"
>>"app\build.gradle" echo     }
>>"app\build.gradle" echo.
>>"app\build.gradle" echo     buildTypes {
>>"app\build.gradle" echo         release {
>>"app\build.gradle" echo             minifyEnabled false
>>"app\build.gradle" echo             proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
>>"app\build.gradle" echo         }
>>"app\build.gradle" echo     }
>>"app\build.gradle" echo }
>>"app\build.gradle" echo.
>>"app\build.gradle" echo dependencies {
>>"app\build.gradle" echo     implementation 'androidx.core:core-ktx:1.12.0'
>>"app\build.gradle" echo     implementation 'androidx.appcompat:appcompat:1.6.1'
>>"app\build.gradle" echo     implementation 'com.google.android.material:material:1.11.0'
>>"app\build.gradle" echo }
call :chk "app\build.gradle"

call :write "app\src\main\res\values\strings.xml"
>>"app\src\main\res\values\strings.xml" echo ^<resources^>
>>"app\src\main\res\values\strings.xml" echo     ^<string name="name"^>Tetris^</string^>
>>"app\src\main\res\values\strings.xml" echo ^</resources^>
call :chk "app\src\main\res\values\strings.xml"

call :write "app\src\main\res\values\themes.xml"
>>"app\src\main\res\values\themes.xml" echo ^<resources^>
>>"app\src\main\res\values\themes.xml" echo     ^<style name="Theme.Tetris" parent="Theme.MaterialComponents.DayNight.NoActionBar"^>^</style^>
>>"app\src\main\res\values\themes.xml" echo ^</resources^>
call :chk "app\src\main\res\values\themes.xml"

call :write "app\src\main\AndroidManifest.xml"
>>"app\src\main\AndroidManifest.xml" echo ^<?xml version="1.0" encoding="utf-8"?^>
>>"app\src\main\AndroidManifest.xml" echo ^<manifest xmlns:android="http://schemas.android.com/apk/res/android"
>>"app\src\main\AndroidManifest.xml" echo     package="com.example.tetris"^>
>>"app\src\main\AndroidManifest.xml" echo.
>>"app\src\main\AndroidManifest.xml" echo     ^<application
>>"app\src\main\AndroidManifest.xml" echo         android:allowBackup="true"
>>"app\src\main\AndroidManifest.xml" echo         android:label="@string/name"
>>"app\src\main\AndroidManifest.xml" echo         android:theme="@style/Theme.Tetris"^>
>>"app\src\main\AndroidManifest.xml" echo         ^<activity
>>"app\src\main\AndroidManifest.xml" echo             android:name=".MainActivity"
>>"app\src\main\AndroidManifest.xml" echo             android:exported="true"^>
>>"app\src\main\AndroidManifest.xml" echo             ^<intent-filter^>
>>"app\src\main\AndroidManifest.xml" echo                 ^<action android:name="android.intent.action.MAIN" /^>
>>"app\src\main\AndroidManifest.xml" echo                 ^<category android:name="android.intent.category.LAUNCHER" /^>
>>"app\src\main\AndroidManifest.xml" echo             ^</intent-filter^>
>>"app\src\main\AndroidManifest.xml" echo         ^</activity^>
>>"app\src\main\AndroidManifest.xml" echo     ^</application^>
>>"app\src\main\AndroidManifest.xml" echo ^</manifest^>
call :chk "app\src\main\AndroidManifest.xml"

call :write "app\src\main\java\com\example\tetris\MainActivity.kt"
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo package com.example.tetris
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo.
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo import androidx.appcompat.app.AppCompatActivity
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo import android.os.Bundle
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo.
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo class MainActivity : AppCompatActivity() {
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo     override fun onCreate(savedInstanceState: Bundle?) {
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo         super.onCreate(savedInstanceState)
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo         setContentView(R.layout.activity_main)
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo     }
>>"app\src\main\java\com\example\tetris\MainActivity.kt" echo }
call :chk "app\src\main\java\com\example\tetris\MainActivity.kt"

call :write "app\src\main\java\com\example\tetris\TetrisEngine.kt"
>>"app\src\main\java\com\example\tetris\TetrisEngine.kt" echo package com.example.tetris
>>"app\src\main\java\com\example\tetris\TetrisEngine.kt" echo.
>>"app\src\main\java\com\example\tetris\TetrisEngine.kt" echo class TetrisEngine {
>>"app\src\main\java\com\example\tetris\TetrisEngine.kt" echo     fun start() { }
>>"app\src\main\java\com\example\tetris\TetrisEngine.kt" echo }
call :chk "app\src\main\java\com\example\tetris\TetrisEngine.kt"

call :write "app\src\main\java\com\example\tetris\TetrisApp.kt"
>>"app\src\main\java\com\example\tetris\TetrisApp.kt" echo package com.example.tetris
>>"app\src\main\java\com\example\tetris\TetrisApp.kt" echo.
>>"app\src\main\java\com\example\tetris\TetrisApp.kt" echo object TetrisApp {
>>"app\src\main\java\com\example\tetris\TetrisApp.kt" echo     val engine = TetrisEngine()
>>"app\src\main\java\com\example\tetris\TetrisApp.kt" echo }
call :chk "app\src\main\java\com\example\tetris\TetrisApp.kt"

call :write "app\src\main\java\com\example\tetris\TetrisScreen.kt"
>>"app\src\main\java\com\example\tetris\TetrisScreen.kt" echo package com.example.tetris
>>"app\src\main\java\com\example\tetris\TetrisScreen.kt" echo.
>>"app\src\main\java\com\example\tetris\TetrisScreen.kt" echo class TetrisScreen {
>>"app\src\main\java\com\example\tetris\TetrisScreen.kt" echo     // drawing logic will be added later
>>"app\src\main\java\com\example\tetris\TetrisScreen.kt" echo }
call :chk "app\src\main\java\com\example\tetris\TetrisScreen.kt"

call :write ".github\workflows\build-apk.yml"
>>".github\workflows\build-apk.yml" echo name: Build APK
>>".github\workflows\build-apk.yml" echo on:
>>".github\workflows\build-apk.yml" echo   push:
>>".github\workflows\build-apk.yml" echo     branches: [ "main" ]
>>".github\workflows\build-apk.yml" echo   workflow_dispatch:
>>".github\workflows\build-apk.yml" echo jobs:
>>".github\workflows\build-apk.yml" echo   build:
>>".github\workflows\build-apk.yml" echo     runs-on: ubuntu-latest
>>".github\workflows\build-apk.yml" echo     steps:
>>".github\workflows\build-apk.yml" echo       - uses: actions/checkout@v4
>>".github\workflows\build-apk.yml" echo.
>>".github\workflows\build-apk.yml" echo       - name: Set up JDK
>>".github\workflows\build-apk.yml" echo         uses: actions/setup-java@v3
>>".github\workflows\build-apk.yml" echo         with:
>>".github\workflows\build-apk.yml" echo           java-version: '17'
>>".github\workflows\build-apk.yml" echo           distribution: 'temurin'
>>".github\workflows\build-apk.yml" echo.
>>".github\workflows\build-apk.yml" echo       - name: Generate Gradle Wrapper
>>".github\workflows\build-apk.yml" echo         run: |
>>".github\workflows\build-apk.yml" echo           ./gradlew --no-daemon wrapper
>>".github\workflows\build-apk.yml" echo           chmod +x gradlew
>>".github\workflows\build-apk.yml" echo.
>>".github\workflows\build-apk.yml" echo       - name: Assemble Debug APK
>>".github\workflows\build-apk.yml" echo         run: ./gradlew assembleDebug
>>".github\workflows\build-apk.yml" echo.
>>".github\workflows\build-apk.yml" echo       - name: Upload APK artifact
>>".github\workflows\build-apk.yml" echo         uses: actions/upload-artifact@v4
>>".github\workflows\build-apk.yml" echo         with:
>>".github\workflows\build-apk.yml" echo           name: app-debug.apk
>>".github\workflows\build-apk.yml" echo           path: app/build/outputs/apk/debug/app-debug.apk
call :chk ".github\workflows\build-apk.yml"

echo.
echo ==========================================
echo   DONE! Files written: !fc!, Errors: !err!
echo ==========================================
echo.
pause
exit /b

:: === Functions ===

:write
break > "%~1"
exit /b

:chk
if exist "%~1" (
    set /a fc+=1
    echo   + %~1 [OK]
) else (
    set /a err+=1
    echo   !!! %~1 [FAILED]
)
exit /b
