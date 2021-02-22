# Amazon EC2
FROM amazonlinux:latest

# 日本語化および日本時間設定
RUN yum install -y glibc-langpack-ja
ENV LANG="ja_JP UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8" \
    TZ="Asia/Tokyo"

WORKDIR /usr/local/src/

# よく使うもの
RUN yum groupinstall -y -q "Development Tools" && yum clean all
RUN yum install -y gmp-devel mpfr-devel ncurses-devel which wget zlib-devel sudo zsh vim

# MySQL client
RUN yum -y localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
RUN yum -y install mysql-community-client

# yumでOpenSSHをインストールする
RUN yum -y install openssh-server
RUN yum -y install openssh-clients

# epel リポジトリを追加
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# sshd起動時に公開鍵が必要なため、作成
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa

# rootでログインできるようにする
RUN sed -ri 's/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config

# rootのパスワードを指定
RUN echo "root:password" | chpasswd

# 接続ユーザーの追加
RUN yum -y install sudo
RUN useradd -m isystk
RUN echo 'isystk:' | chpasswd
RUN usermod -aG wheel isystk
RUN echo 'Defaults visiblepw'             >> /etc/sudoers
RUN echo 'isystk ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22

# sshdを起動
CMD ["/usr/sbin/sshd", "-D"]
