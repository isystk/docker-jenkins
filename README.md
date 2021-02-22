# Docker を利用した Jenkins サンプル

## Description

Jenkins の Docker 環境構築サンプルです。

## Demo

## VS.

## Requirement

## Usage

## Install

```
# すべてのコンテナを起動する
$ ./dc.sh start

# web-appにログインする
$ ./dc.sh web-app login

# web-appからDBにログインする
musql -h 172.30.0.12 -u root -ppassword

# jenkinsを表示する
$ open http://localhost:8080/

# jenkinsの初期パスワードを確認する
$ ./dc.sh jenkins login
cat /var/jenkins_home/secrets/initialAdminPassword

```

## Contribution

## Licence

[MIT](https://github.com/isystk/docker-jenkins/LICENCE)

## Author

[isystk](https://github.com/isystk)
