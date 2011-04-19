Geckoの言語ファイル置き換えパッチ

AddLangStrings.bat		スクリプト起動バッチ
AddLangStrings.ps1		言語ファイル置換スクリプト

外部からダウンロードしてきたツールです
DOS2UNIX.EXE			改行コード変更ツール
7-Zip				圧縮ツール　※スクリプト中でパスを指定してください。


\\fileserver02.ad.lunascape.co.jp\dev\nightly\Lunascape\Gecko_YYYYMMDD.X
フォルダ以下Binariesフォルダと同じ階層に
Pachフォルダを作成し、その中で実行する前提になっております。

【実行環境の設定】
$7ZIP_PATH に7z.exeのパスを記述してください
$BASE_DIR に各言語パックのフォルダが置かれるパスを指定してください


翻訳対象、言語の追加方法

　翻訳対象の追加
・DTDのエンティティ、PROPERTYのプロパティの値を変更する場合
　対象言語の$ENTITY_PROPERTY_LISTに
　変更するファイル名,改行コード（0:CR+LF 1:LF）,対象エンティティ/プロパティの検索文字列,変更後の値,値の後に入れるフッタ
　を追加してください
　※ここに指定されたエンティティ、プロパティがない場合その値を追記します

・任意のテキストファイルの文字列置換を行う場合
　対象言語のREPLACE_LISTに
　変更するファイル対象ファイル,改行コード,置換前文言,置換後文言
　を追加してください
　※置換対象に指定された文言がない場合、改行コードの変更のみ行います

　言語の追加
・$DST_LIST に追加する言語パックの..\Binaries以下のフォルダ名
　..\Binaries\GeckoCoreSdk\chrome　以下にあるjarファイルのファイル名を追加してください
・上記で追加した一に対応するように
　$ENTITY_PROPERTY_LIST、$REPLACE_LISTに項目を追加してください