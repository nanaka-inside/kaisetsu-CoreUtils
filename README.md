# 解説CoreUtils

![cover](https://ba96f6cb-a-62cb3a1a-s-sites.googlegroups.com/site/dai7sec/home/CU_sample_0502.jpg "cover")


このリポジトリは同人サークル[第7開発セクション](https://sites.google.com/site/dai7sec/ "第7開発セクション")が[COMITIA](http://www.comitia.co.jp) 108 (2014/5/5)で発行した同人誌「解説CoreUtils」の原稿です。
同じサークルが発行した「ななか Inside PRESS」の第2号と第3号に連載されていた「Coreutils大全」という記事をまとめて、本書の印刷にあたり加筆修正したものです。

[Coreutils](http://www.gnu.org/software/coreutils/ "Coreutils")のマニュアルを筆者([@tboffice](https://twitter.com/tboffice))がひと通り読んで、便利そうなところや注意点などをまとめました。シェルスクリプトを書くときのお供にしていただければ幸いです。

# 検索エンジンからお越しの方へ

同人誌として本になりました。購入していただけると、筆者のご飯になります。COMIC ZINさんで取り扱っています。

[COMIC ZINさん販売ページ](https://shop.comiczin.jp/products/detail.php?product_id=39292) 第7版が出ました。
ビルド済みのPDFファイルは[booth](https://dai7sec.booth.pm/items/1564858)や[Gumroad](https://gum.co/kaisetsu-coreutils)にあります。 

# ビルド手順
1. Sphinxのセットアップ
2. Texのセットアップ
3. PDFの生成

## 1. Sphinxのセットアップ
easy_installやpipでインストールすればおｋ。

## 2. Texのセットアップ
platexをインストールすればおｋ。著者はTex Liveを使ってインストールしました。

## 3. PDFの生成
まず、今までSphinxでPDFを生成したことがない方は、[日本語PDFパッチ](http://sphinx-users.jp/cookbook/pdf/latex.html#sphinxpdf)を当てましょう。
これを当てないとlatex実行時にエラーが発生します。

ここまでインストールができていれば次のコマンドでPDFが生成されます。

```shell
./latex-build.sh
```

PDFは`_build/latex/index-b5.pdf`に生成されます。
PDFのサイズはB5変型となります。ご注意ください。

# お願い
ほぼ筆者一人で書いたため、間違っているところとか、説明が足りない部分があると思います。もしそういうところを見つけて見つけた場合にはプルリクいたただけるとありがたいです。

all.rstがでかすぎる！分割した！とか、conf.pyのpreambleを修正した！とか、latex-build.shに細工した！とかありましたら、それもプルリクください。よろしくお願いします。

