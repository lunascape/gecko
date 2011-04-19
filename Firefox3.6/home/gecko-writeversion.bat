pushd %~dp0
call "%VS90COMNTOOLS%vsvars32.bat"
powershell -command "& {.\\%~n0.ps1 .\\output\\dist\\ ..\\Binaries\\}"
popd