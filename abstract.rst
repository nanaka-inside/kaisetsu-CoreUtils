.. raw:: latex

   \begin{abstract} \newpage
   \hbox{}\newpage

はじめに
========

まえがき
-------------

「情報というのは面白いもので、こちらから探しにいかないとないのと同じで、ゲームなどでも攻略に行き詰まったりして、ネットでWikiを調べてみたり、攻略本を探してようやく出てくるという性質でして、人間、必要に駆られないと、なかなか新しい情報を得ようとしない [#core-bukkyo]_ ものです。」 [#coreutils-monodesu]_

.. [#core-bukkyo] なかなか新しい情報を得ようとしない：新しい情報が得られる便利な仕組みはいくつもあるものの、そういうツールが増えれば増えるほど「自分にとって都合のよい新しい情報」しか目に入らなくなるのが人間の愛おしさである。
.. [#coreutils-monodesu] 蝉丸P (2012). 蝉丸Pのつれづれ仏教講座 株式会社エンターブレイン p.263


この本は何？
-----------
この本は、GNU Coreutils [#coreutils-url]_ の執筆時点の最新のマニュアル [#coreutils-manual]_ をひと通り眺めてみて、解説をしてみようというコンセプトの本に書かれた本です [#ikisatsu]_ 。
Coreutils 8.24 (2015-07-03 release) の内容まで盛り込んでいます。

.. [#ikisatsu] もともとは、弊サークル・第7開発セクションが発行してきた同人誌「ななかInside PRESS」の2号と3号にまたがって掲載された「Coreutils大全」という連載を一冊の本にまとめたものが初版でした


対象読者
--------

Linuxのコンソールでお仕事をしていると、シェルスクリプトで楽をしようとします。
楽をするため、筆者がよく使うコマンドを調べていたところ、Coreutilsのマニュアルにたどり着きました。
気づけば、Coreutilsのマニュアルを読んで、コマンドの実行方法や、知らなかったコマンドや、いままで使ったことがないオプションを見つけていました。

.. [#coreutils-url] http://www.gnu.org/software/coreutils/
.. [#coreutils-manual] http://www.gnu.org/software/coreutils/manual/
.. [#core-sed] coreutilsに含まれないコマンド(sedとか)がばんばん出てくるしどうしてこうなった

たとえば、

* 「 ``cat`` をたんどくでじっこうしたら どうなるです？」
* 「ふぁいるを ``pr | pr`` したらどうなるです？」「べとべとです？」
* 「 ``tail -f`` と ``tailf`` はどこがちがうです？」
* 「だーくふれいむますたー！」(指を指して)「あのころのきおくをけすにはどうやるです？」
* 「ばいなりでーたおいしいです」 [#core-yousei]_ 
* 「イエッス！アスミス！」
* 「ここはどこ？わたしはだあれ？」
* 「せんせい！そいんすうぶんかいがしたいです！」 [#core-yousei]_ [#saiten]_ 

.. figure:: ./illust/fairy.eps
   :alt: 働く妖精(?)さん
   :scale: 80%

   働く妖精(?)さん

.. [#core-yousei] どこぞの妖精さんをお借りしました。扱いにくいキャラクターですね。文章にするとかどくせいがひじょうにわるいです？
.. [#saiten] 同僚の@saiten氏に描いていただきました。妖精さんの画像を要請したらこんなイラストが上がってきました。イラスト技術が養成されたんじゃないでしょうか（ドヤァ

普段linuxを使っているけど、このコマンド知らなかった、こんな使い方ができるのか、という発見が一つでもあれば幸いです。
筆者がよく使うコマンドや Tips 、実行例も載せています。それでは、Coreutilsの世界へようこそ。


ご注意
------
基本的に、ソースを読んで実装部分などの話はありません。コマンド・オプションの使い方を説明しています。
バージョンにより、使えないコマンドやオプションがあります。本書はバージョン8.24のマニュアルを元にコマンドの解説を行っています。
また、筆者が検証した環境は、DigitalOcean(CentOS 6.6) [#dovup]_ と amazon EC2 [#amazonec2]_ のマイクロインスタンスです。パッケージはほぼデフォルトのため、CentOS 6.6ではCoreutils 8.4、amazon EC2では8.21です。
本文中ででてくるコマンドのサンプルは、上記の環境で実行していますが、使うときは誰にも迷惑をかけないところで実験・検証してください。

.. [#dovup] CentOS 6.5のイメージがあり、yum updateすると 6.6になった
.. [#amazonec2] /etc/issue 曰く、 Amazon Linux AMI release 2014.03

この本では、Coreutilsのマニュアルの冗長な部分はできるだけ端折って、面白そうなところや、実践的な部分を取り上げました。
もし時間があるようであれば、Coreutilsのマニュアルを上から下まで読んでみてください [#coreutils-read]_ 。新たな発見があると思います。
また、文章の都合上、Coreutilsにないコマンドも載っています [#okonano]_ 。

本文中の「原文」はCoreutilsのマニュアルのことを指します。

.. [#okonano] 怒らないよね？おこなの？(やめろってば
.. [#coreutils-read] 正直なところ、かなり面倒です。あんまり面白くないです


そもそもCoreutilsとは
---------------------
「コアユーティルズ」と読みます。文字に落としてみるとダサいですね。
まあ、そのへんは置いといて、 ``ls`` や ``cat`` など、linuxでは欠かせないコマンドをまとめたパッケージです [#coreutils-umu]_ 。
Fileutils, Shellutils, Textutilsというutilsを統合したものです。
ChangeLogをみたところ、一番古い日付は2002-07-01でした。
おそらくそのころに統合されたのでしょう。メジャーバージョンは2003年4月にバージョン5として登場しました。
2015年7月現在、8.24 (2015-07-03) がリリースされています [#hinpan]_ 。

.. [#coreutils-umu] この本をお手にとっている人に、Coreutilsの説明をしてもあまり意味がないような気もしますが、まあ、一応
.. [#hinpan] 現在でも数日おきにバグフィックスなどが入っています

MacにもCoreutilsと同じく、``ls`` や ``cat`` などのコマンドがあります。こちらはBSD由来なので、GNU Coreutilsの実装と異なっています。
MacにGNU Coreutilsをインストールしたいときは、homebrewでインストールできます。

.. code-block:: sh 

   brew install coreutils

なお、既存のコマンドと名前がかぶるので、プレフィクスにgがついています。 ``ls`` だったら ``gls`` となっています。 ``od`` だった場合は・・・もうあとは分かるな・・・？


本稿の構成
----------
最初にCoreutilsパッケージのコマンドに共通のオプションを解説し、Coreutilsのマニュアルの通りにコマンドをならべて解説しています。一部、冗長なところがあるのでまとめたりしています。問題ないでしょう。


そんなことより
-------------

ソースどこだよ：
  githubにあります　https://github.com/coreutils/coreutils/

zipでくれ：
  http://ftp.gnu.org/gnu/coreutils/　か https://github.com/coreutils/coreutils/releases

頻繁に寄せられる質問は：
  FAQあります　http://www.gnu.org/software/coreutils/faq/coreutils-faq.html

マニュアルは：
  http://www.gnu.org/software/coreutils/manual/

メーリングリストは：
  http://lists.gnu.org/archive/html/coreutils/


.. raw:: latex

   \end{abstract}
