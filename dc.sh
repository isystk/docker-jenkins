#! /bin/bash

DOCKER_HOME=$(dirname $0)/docker
DOCKER_COMPOSE="docker-compose -f ${DOCKER_HOME}/docker-compose.yml "

MYSQL_CLIENT=${DOCKER_HOME}/mysql/scripts
PATH=$PATH:$MYSQL_CLIENT

function usage {
    cat <<EOF
$(basename ${0}) is a tool for ...

Usage:
  $(basename ${0}) [command] [<options>]

Options:
  stats|st                 Dockerコンテナの状態を表示します。
  init                     Dockerコンテナ・イメージ・生成ファイルの状態を初期化します。
  start                    すべてのDaemonを起動します。
  stop                     すべてのDaemonを停止します。
  mysql login              MySQLデータベースにログインします。
  mysql export             MySQLデータベースのdumpファイルをエクスポートします。
  --version, -v     バージョンを表示します。
  --help, -h        ヘルプを表示します。
EOF
}

function version {
    echo "$(basename ${0}) version 0.0.1 "
}

case ${1} in
    stats|st)
        docker container stats
    ;;

    init)
        # 停止＆削除（コンテナ・イメージ・ボリューム）
        ${DOCKER_COMPOSE} down --rmi all --volumes
        rm -Rf ./mysql/data/*
        rm -Rf ./mysql/logs/*
    ;;

    start)
        ${DOCKER_COMPOSE} up -d
    ;;

    stop)
        ${DOCKER_COMPOSE} stop && ${DOCKER_COMPOSE} rm -fv
    ;;

    jenkins)
      case ${2} in
          login)
              $DOCKER_COMPOSE exec jenkins /bin/bash
          ;;
          *)
              usage
          ;;
      esac
    ;;

    mysql)
      case ${2} in
          login)
              mysql -u root -ppassword -h 127.0.0.1
          ;;
          export)
              mysqldump -u root -ppassword -h 127.0.0.1 -A > ./mysql/init/dump.sql
          ;;
          *)
              usage
          ;;
      esac
    ;;

    web-app)
      case ${2} in
          login)
              $DOCKER_COMPOSE exec --user isystk -w /home/isystk web-app /bin/zsh
          ;;
          *)
              usage
          ;;
      esac
    ;;

    help|--help|-h)
        usage
    ;;

    version|--version|-v)
        version
    ;;
    
    *)
        echo "[ERROR] Invalid subcommand '${1}'"
        usage
        exit 1
    ;;
esac


