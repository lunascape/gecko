@echo off
setlocal
set SCRIPT_DIR=%~dp0
pushd %SCRIPT_DIR%
set BASE_LANG=en-US

echo #Exec %~n0
echo #Copy toolkit.jar
for %%l in (de en-US es fr it ja ko pt ru zh-CN zh-TW) do (
	xcopy /Y /R ..\..\home\output\dist\bin\chrome\toolkit.jar ..\..\Binaries\%%l\GeckoCoreSdk\chrome\
)

echo #Copy lang.jar
xcopy /Y /R ..\..\home\output\dist\bin\chrome\en-US.jar ..\..\Binaries\en-US\GeckoCoreSdk\chrome\

for %%l in (bg cs da de el en-GB es et fi fr hr hu it ja ko lt lv nb nl pl pt ro ru sk sl sv zh-CN zh-TW) do (
	xcopy /Y /R .\OriginalBinaries\%%l\GeckoCoreSdk\chrome\*.jar ..\..\Binaries\%%l\GeckoCoreSdk\chrome\
)
popd
echo #Done %~n0
