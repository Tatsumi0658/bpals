# README
## サイト名
B-PALs

## 概要
男性の化粧やメイクアップに関する写真や動画の投稿、化粧品の情報の閲覧などができ、Youtube以外では取得しにくい男性向け化粧情報を入手することができます

## コンセプト
男性メイク情報アプリ


## 機能
- ユーザー登録
  - メールアドレス、名前、パスワードは必須
- ログイン機能
  - SNSログイン
  - メールログイン
- パスワード再設定機能
- 写真、動画の投稿機能
  - 写真または動画は必須
- 投稿編集機能
- 投稿削除機能
  - 削除は投稿者のみ可能
- 投稿いいね機能
  - １投稿に対して1人1回のみいいね可能
- 投稿へのコメント投稿機能
- 投稿へのコメント編集機能
  - コメント主のみ編集可能
- 投稿へのコメント削除機能
  - コメント主のみ削除可能
- 検索機能
  - ユーザー検索
  - ハッシュタグ検索
  - 商品検索
- 管理者権限
  - 商品登録機能
- 商品へのコメント投稿機能
- 商品へのコメント編集機能
  - コメント主のみ編集可能
- 商品へのコメント削除機能
  - コメント主のみ削除可能

## 開発環境  
ruby 2.6.3  
rails 5.2.2  
Bundler 2.0.1  


## カタログ設計
https://docs.google.com/spreadsheets/d/1h2jP8d2TZmoGTXND2FDhBYhLG0hpsnxJaMOfGUH_wNY/edit#gid=0

## ER図
https://docs.google.com/spreadsheets/d/11wuVuNT3d7YFZFZ46aXI-vLIzJgs8-Pb5Q-zsPoQM5I/edit#gid=1833524702

## テーブル定義
https://docs.google.com/spreadsheets/d/11wuVuNT3d7YFZFZ46aXI-vLIzJgs8-Pb5Q-zsPoQM5I/edit#gid=1833524702

## 画面遷移図
https://docs.google.com/spreadsheets/d/1tSL0fZqPIx14sMkYiZjrP9hPmvOQGmfBDfah3HHQ3Lc/edit#gid=0

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1x8WiuGDJbE1Kk0_UgVT8uheIP51GfY5AgkO6UNF-O1o/edit#gid=0

## gem
devise  
omniauth  
carrierwave  
ransack  
capistrano  
unicorn  
minimagick   
