pushd %~dp0\langpack
call copyBinaries.bat
call AddLangStrings.bat
rem call AddLangStrings_ToolKit.bat
popd