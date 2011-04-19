rem GeckoCoreSdk�Ɋ܂܂�錾��p�b�N�t�@�C���A�g���p����t�@�C�����R�s�[����
rem ����
rem %1 : $(SolutionRoot)
rem %2 : $(DropLocation)
rem %3 : $(BuildNumber)

set ffversion="Firefox3.6"

set target_ja="ja"
set target_gl="ml11_gl"
set target_eu="ml17_eu"

rem common���͑S�ăR�s�[
xcopy %1\%ffversion%\Binaries\common\*.* %2\%3\Binaries\%target_ja%\ /E /Y /I
xcopy %1\%ffversion%\Binaries\common\*.* %2\%3\Binaries\%target_gl%\ /E /Y /I
xcopy %1\%ffversion%\Binaries\common\*.* %2\%3\Binaries\%target_eu%\ /E /Y /I

rem �o�[�W�����w�b�_���R�s�[
copy %1\%ffversion%\Binaries\gecko-version.h %2\%3\Binaries\gecko-version.h /Y

rem �e���ꂲ�ƂɕK�v�ȃt�@�C�����R�s�[(���{��)
for %%f in (en-US ja) do (
	rem ����p�b�N�t�@�C��
	if "%%f" == "es" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\es-ES.jar %2\%3\Binaries\%target_ja%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\es-ES.manifest %2\%3\Binaries\%target_ja%\GeckoCoreSdk\chrome\ /E /Y /I
	) else if "%%f" == "pt" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\pt-PT.jar %2\%3\Binaries\%target_ja%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\pt-PT.manifest %2\%3\Binaries\%target_ja%\GeckoCoreSdk\chrome\ /E /Y /I
	) else (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\%%f.jar %2\%3\Binaries\%target_ja%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\%%f.manifest %2\%3\Binaries\%target_ja%\GeckoCoreSdk\chrome\ /E /Y /I
	)

	rem �g���p����t�@�C��
	mkdir %2\%3\Binaries\%target_ja%\GeckoCoreSdk\locales\%%f\data\searchplugins
	copy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\searchplugins %2\%3\Binaries\%target_ja%\GeckoCoreSdk\locales\%%f\data\searchplugins /Y
	echo F | xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\prefs.js %2\%3\Binaries\%target_ja%\GeckoCoreSdk\locales\%%f\data\prefs.js /E /Y /I /R
)

rem �e���ꂲ�ƂɕK�v�ȃt�@�C�����R�s�[(11���ꕪ)
for %%f in (de en-GB en-US es fr it ko pt ru zh-CN zh-TW) do (
	rem ����p�b�N�t�@�C��
	if "%%f" == "es" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\es-ES.jar %2\%3\Binaries\%target_gl%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\es-ES.manifest %2\%3\Binaries\%target_gl%\GeckoCoreSdk\chrome\ /E /Y /I
	) else if "%%f" == "pt" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\pt-PT.jar %2\%3\Binaries\%target_gl%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\pt-PT.manifest %2\%3\Binaries\%target_gl%\GeckoCoreSdk\chrome\ /E /Y /I
	) else (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\%%f.jar %2\%3\Binaries\%target_gl%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\%%f.manifest %2\%3\Binaries\%target_gl%\GeckoCoreSdk\chrome\ /E /Y /I
	)

	rem �g���p����t�@�C��
	mkdir %2\%3\Binaries\%target_gl%\GeckoCoreSdk\locales\%%f\data\searchplugins
	copy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\searchplugins %2\%3\Binaries\%target_gl%\GeckoCoreSdk\locales\%%f\data\searchplugins /Y
	echo F | xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\prefs.js %2\%3\Binaries\%target_gl%\GeckoCoreSdk\locales\%%f\data\prefs.js /E /Y /I /R
)


rem �e���ꂲ�ƂɕK�v�ȃt�@�C�����R�s�[(17���ꕪ + �f�t�H���gen-US)
for %%f in (bg cs da el en-US et fi hr hu lt lv nb nl pl ro sk sl sv) do (
	rem ����p�b�N�t�@�C��
	if "%%f" == "es" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\es-ES.jar %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\es-ES.manifest %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
	) else if "%%f" == "nb" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\nb-NO.jar %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\nb-NO.manifest %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
	) else if "%%f" == "pt" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\pt-PT.jar %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\pt-PT.manifest %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
	) else if "%%f" == "sv" (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\sv-SE.jar %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\sv-SE.manifest %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
	) else (
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\%%f.jar %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
		xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\chrome\%%f.manifest %2\%3\Binaries\%target_eu%\GeckoCoreSdk\chrome\ /E /Y /I
	)

	rem �g���p����t�@�C��
	mkdir %2\%3\Binaries\%target_eu%\GeckoCoreSdk\locales\%%f\data\searchplugins
	copy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\searchplugins %2\%3\Binaries\%target_eu%\GeckoCoreSdk\locales\%%f\data\searchplugins /Y
	echo F | xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\prefs.js %2\%3\Binaries\%target_eu%\GeckoCoreSdk\locales\%%f\data\prefs.js /E /Y /I /R
)

