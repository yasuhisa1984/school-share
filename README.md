ITスクールシェア
====
https://school-share-staging.herokuapp.com/



## 各バージョンと動作確認環境

* Ruby バージョン 2.4.1

* rails バージョン 5.1.6

* Database PostgreSQL 9.6.2



## サービス概要
ITスクール選びで悩む人が、実際に入校した人の体験を知ることで、
自分に合っているかどうかがわかる口コミサイトです。
ITスクール自体の段階評価ではなく、スクールで
実際に何が身についたかのスキルを公開するのが特色です。
全国のITスクールの価格・費用・コース・期間についての情報を検索することで
自分に合ったスクールが探せます。



## 機能
- 口コミのスキルをグラフで表示機能
- ユーザーの口コミCRUD処理
- ユーザーの口コミ検索機能
- 全国のITスクールの検索機能
- SNSログイン機能
- DB管理機能
- お問い合わせ機能



## ER図
![er](http://amecomi.boo.jp/school-share/images/er.png)



## 使い方
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。

```
$ git clone
```

次に、以下のコマンドで必要になる Ruby Gems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

これで、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails s
```


## 作者
[yasuhisa1984](https://github.com/yasuhisa1984/)
