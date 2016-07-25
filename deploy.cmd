@echo off
cls

echo "install jspm"
IF NOT EXIST jspm (
    call npm install jspm -g
)

if errorlevel 1 (
  exit /b %errorlevel%
)

echo "Change to Aurelia app directory"
cd ./src/DoctoralSurvey/
if errorlevel 1 (
  exit /b %errorlevel%
)

echo %cd%
echo "npm install"
call npm install
if errorlevel 1 (
  exit /b %errorlevel%
)

echo %cd%
echo "jspm install"
call jspm install -y
if errorlevel 1 (
  exit /b %errorlevel%
)

cd ../..
echo %cd%
echo "finish"

IF NOT EXIST build.fsx (
  .paket\paket.exe update
  packages\build\FAKE\tools\FAKE.exe init.fsx
)

call build.cmd %*

echo "Bundle"

cd ./src/DoctoralSurvey/

call gulp bundle