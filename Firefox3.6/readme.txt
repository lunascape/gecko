Firefoxのビルドのためには、Visual Studio, Windows SDKなどがインストールされている必要があります。
詳細は以下のページを見て、必要なファイルをまずインストールしてから行ってください。
http://developer.mozilla.org/ja/docs/Windows_Build_Prerequisites

サマリ：
Visual Studio 2005
Windows Vista SDK

1. Lunascape最新版に組み込んでいるGeckoと同じものをビルドする場合
Release/Debug構成を選択して、ビルドをする。
home/output/dist/binにバイナリができている

2. 次のLunascapeに組み込むGeckoをバージョンアップする場合
do_build_gecko.sh のバージョンを変更して保存
Release/Debug構成を選択して、ビルドをする。
home/output/dist/binにバイナリができている

注意点
※ビルドはVisual Studioプロセスを強制終了しない限り止まりません。
※ソースの取得は、かならずスペースを含まないパスに行ってください。
※64bitマシンでのコンパイルは保証されていません。