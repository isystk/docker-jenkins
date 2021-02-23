FROM jenkins/jenkins:jdk11

MAINTAINER isystk

# タイムゾーンを東京に設定
ENV TZ "Asia/Tokyo"

# install via apt
USER root

# drop back to the regular jenkins user - good practice
USER jenkins