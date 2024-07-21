#!/usr/bin/env sh
#set -x
set -e
DIR=~/Downloads
MIRROR=https://github.com/warrensbox
APP=terraform-switcher

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file="${APP}_v${ver}_${platform}.${archive_type}"
    # https://github.com/warrensbox/terraform-switcher/releases/download/v1.2.2/terraform-switcher_v1.2.2_linux_arm64.tar.gz
    local url=$MIRROR/$APP/releases/download/v$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    local checksums="${APP}_v${ver}_checksums.txt"
    # https://github.com/warrensbox/terraform-switcher/releases/download/v1.2.2/terraform-switcher_v1.2.2_checksums.txt
    local url=$MIRROR/$APP/releases/download/v$ver/$checksums
    local lchecksums="${DIR}/${checksums}"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $ver $lchecksums darwin amd64
    dl $ver $lchecksums darwin arm64
    dl $ver $lchecksums linux 386
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums linux arm64
    dl $ver $lchecksums linux armv6
    dl $ver $lchecksums linux armv7
    dl $ver $lchecksums windows 386
    dl $ver $lchecksums windows amd64
}

dl_ver ${1:-1.2.2}
