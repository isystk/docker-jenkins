# Docker を利用した Jenkins サンプル

## Description

Jenkins の Docker 環境構築サンプルです。

## Demo

## VS.

## Requirement

## Usage

```
# すべてのコンテナを起動する
$ ./dc.sh start

# jenkinsにSSHログインする
$ ./dc.sh jenkins login

# jenkinsからweb-appにSSHログインする
ssh isystk@web-app

# web-appからDBにログインする
mysql -h 172.30.0.12 -u root -ppassword

# jenkinsを表示する
$ open http://localhost:8080/

# jenkinsの初期パスワードを確認する
$ ./dc.sh jenkins login
cat /var/jenkins_home/secrets/initialAdminPassword

```

## Install

Jenkins で OpenJDK11 をインストール
https://qiita.com/boushi-bird@github/items/49627b6a355ea2dfa57a

## Contribution

## Licence

[MIT](https://github.com/isystk/docker-jenkins/LICENCE)

## Author

[isystk](https://github.com/isystk)
