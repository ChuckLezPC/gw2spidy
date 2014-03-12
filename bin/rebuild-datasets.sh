#!/bin/bash

MOD=$1
LOGDIR="/var/log/gw2spidy"

if [ -z "$ROOT" ]; then
    ROOT=`php -r "echo dirname(dirname(realpath('$(pwd)/$0')));"`
    export ROOT
fi

if [ -z "$PHP" ]; then
    if [ -z `which hhvm` ]; then
        PHP="php"
        export PHP
    else
        PHP="hhvm"
    fi
fi

if [[ -z "${MOD}" ]]; then
    MOD=1
fi

for ((i = 0; i < $MOD; i++)); do 
    $PHP ${ROOT}/tools/rebuild-datasets.php $i $MOD &
done

