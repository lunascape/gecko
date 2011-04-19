rem GeckoCoreSdkに含まれる言語パックファイル、拡張用言語ファイルをコピーする
rem 引数
rem %1 : $(SolutionRoot)
rem %2 : $(DropLocation)
rem %3 : $(BuildNumber)

set ffversion="Firefox3.6"

set target_ja="ja"
set target_gl="ml11_gl"
set target_eu="ml17_eu"

rem common下は全てコピー
xcopy %1\%ffversion%\Binaries\common\*.* %2\%3\Binaries\%target_ja%\ /E /Y /I
xcopy %1\%ffversion%\Binaries\common\*.* %2\%3\Binaries\%target_gl%\ /E /Y /I
xcopy %1\%ffversion%\Binaries\common\*.* %2\%3\Binaries\%target_eu%\ /E /Y /I

rem バージョンヘッダをコピー
copy %1\%ffversion%\Binaries\gecko-version.h %2\%3\Binaries\gecko-version.h /Y

rem 各言語ごとに必要なファイルをコピー(日本語)
for %%f in (en-US ja) do (
	rem 言語パックファイル
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

	rem 拡張用言語ファイル
	mkdir %2\%3\Binaries\%target_ja%\GeckoCoreSdk\locales\%%f\data\searchplugins
	copy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\searchplugins %2\%3\Binaries\%target_ja%\GeckoCoreSdk\locales\%%f\data\searchplugins /Y
	echo F | xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\prefs.js %2\%3\Binaries\%target_ja%\GeckoCoreSdk\locales\%%f\data\prefs.js /E /Y /I /R
)

rem 各言語ごとに必要なファイルをコピー(11言語分)
for %%f in (de en-GB en-US es fr it ko pt ru zh-CN zh-TW) do (
	rem 言語パックファイル
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

	rem 拡張用言語ファイル
	mkdir %2\%3\Binaries\%target_gl%\GeckoCoreSdk\locales\%%f\data\searchplugins
	copy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\searchplugins %2\%3\Binaries\%target_gl%\GeckoCoreSdk\locales\%%f\data\searchplugins /Y
	echo F | xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\prefs.js %2\%3\Binaries\%target_gl%\GeckoCoreSdk\locales\%%f\data\prefs.js /E /Y /I /R
)


rem 各言語ごとに必要なファイルをコピー(17言語分 + デフォルトen-US)
for %%f in (bg cs da el en-US et fi hr hu lt lv nb nl pl ro sk sl sv) do (
	rem 言語パックファイル
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

	rem 拡張用言語ファイル
	mkdir %2\%3\Binaries\%target_eu%\GeckoCoreSdk\locales\%%f\data\searchplugins
	copy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\searchplugins %2\%3\Binaries\%target_eu%\GeckoCoreSdk\locales\%%f\data\searchplugins /Y
	echo F | xcopy %1\%ffversion%\Binaries\%%f\GeckoCoreSdk\prefs.js %2\%3\Binaries\%target_eu%\GeckoCoreSdk\locales\%%f\data\prefs.js /E /Y /I /R
)

