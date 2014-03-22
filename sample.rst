
.. rstのサンプルファイル。make html, make latexpdfja とかして効果を確かめる用

.. コメント

.. コメント
   ここもコメント
   まだまだコメント

################
chapter 1 部
################
.. 「chapter 1 章です」の後ろあるいはぴったりまで === がないと効果がなくなるので注意
    この文章は=,-,^の順で階層化している。この順は慣習であるらしい
    違う記号がでてきたら、階層化のレベルが変化する。このへんのニュアンスは慣れろ！

第1章
*******

.. toctree::
.. ここからtoctreeを入れ子に出来る
   構造については、http://sphinx-users.jp/gettingstarted/make_project.html
   toctreeを使って階層化するならindex.rstで :maxdepth: 3 としておいたほうが無難

section
============

subsection
-----------

subsubsection
^^^^^^^^^^^^^^

paragraph
""""""""""

第2章
*********

書体の変更
==========

下記の例をそのままお借りしました。
http://sphinx-users.jp/gettingstarted/use_markup.html

**太字**

*斜体*

``りてらる``

`リンク付きテキスト <http://python.org>`_

コードブロック
==============

.. コードブロック
   ::のあとには改行を入れないといけないのだ！！

::

    劇中には、リアリティー追求のため、一部実在の設定・名称や科学的根拠に基づく表現を使用しておりますが、作品全体としてはこの物語はフィクションです


.. pythonのコードを書くときにはこんな感じ。言語はいろいろあるらしい
.. code-block:: python

   import this
   import os


.. code-block:: c

   int
   main (int argc, char 
   )
   {}

箇条書き
========

* 宇都宮市
* 那須塩原市
* 真岡市

1. まさし
2. みんみん
#. 夢餃子(#を使うと、自動で数字が割り当てられます)

餃子
   宇都宮の名物として有名。餃子の像もある。静岡の浜松がライバル。
   半角スペース3文字のインデントが必要
ジャズ
   宇都宮はジャズの町としても売り出し中。
   楽器メーカーを多数抱える静岡の浜松がライバル
焼きそば
   知る人ぞ知る宇都宮の名物。専門店多数。なぜかビニール袋で持ち帰る。



その場に入れる脚注
==================

.. note::
   注釈です note
   - テスト
     テスト２
   - テスト


.. warning::
   警告です！ warning
   TeXのpdfでもうまく出る


.. hint::
   ヒント、らしい。hint


.. important::
   重要。important


.. tip::
   チップス。ポテト。tip。
   - kakeru?
     - kakesou



footnote的な
=============

Lorem ipsum [#f1]_ dolor sit amet          ... [#f2]_

.. rubric:: 脚注

.. [#f1] 最初の脚注のテキストです。
.. [#f2] ２番目の脚注のテキストです。

引用
=====
Lorem ipsum [9]_ dolor sit amet.

.. [9] 参考になった書籍、論文、URL、その他



topicらしい
============
.. topic:: Topic Title

   Subsequent indented lines comprise
   the body of the topic, and are
   interpreted as body elements.


diagram
========

blockdiagを使うとき、png画像ででてくる。pngのファイルをそのままLaTeXでビルドするとこける。
conf.py で blockdiag_tex_image_format = 'PDF' するとPDFをそのまま貼り付けようとするので失敗する。
epsで出すようにできないもんだろうかなー

.. 
   .. blockdiag::
   blockdiag admin {
   top_page -> config -> config_edit -> config_confirm -> top_page;
   }



テーブル
========

+---------------------+
|栃木県内の勉強会     |
+========+============+
|宇都宮  |集合知勉強会|
+        +------------+
|        |Objective-C |
+--------+------------+
|西那須野|とちぎRuby  |
+--------+------------+


参考
=====

http://sphinx-users.jp/doc10/rest.html
