cordova-sample
==============

ハイブリッドアプリのサンプルプログラムです。

完全にフローにできていないので覚え書き程度ですが、、、


## 構成

* javascript関連
 * CoffeeScript
 * backbone.js
 * require.js

* buildツール
 * Grunt

* CSS関連
 * SCSS

## Get Started

ソースをチェックアウトして、シミュレータ動かすまで

### Cordovaの動作環境

cordovaの前にnode( npm )の環境が必須なので
[ここ](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager)を参考にそろえてください。

#### Cordova Command line tool

[ここ](http://docs.phonegap.com/en/edge/guide_platforms_android_index.md.html#Android%20Pltform%20Guide)を読んでもらいたいですが、
下のコマンド一発で入るはずです。

```bash
$ sudo npm install -g phonegap
```

#### Android

AndroidSDK等、Android開発環境が必要です。
特にこだわりが無ければ [ここ](http://developer.android.com/sdk/index.html)から ADT BUNDLEを落としてきて、
中身のEclipseを起動すれば良いと思います。PATHとうとうを指定しないと行けないので、保存先には気をつけてください。

[ここ](http://docs.phonegap.com/en/edge/guide_platforms_android_index.md.html#Android%20Pltform%20Guide)を参考に、
Androidアプリのhelloworldを作りましょう。
SDKへのPATHが通っていない！と怒られたらその都度修正しましょう。

無事HelloWorldができたらいよいよソースをチェックアウトするときです。。。

### サンプルプログラムを動かす

#### Grunt環境の整備

* grunt のinstall
* grunt コマンドの実行

それくらいをまとめる。

#### プラットフォーム用にビルド

#### 実行



