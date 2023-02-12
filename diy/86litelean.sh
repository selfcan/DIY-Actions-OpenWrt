#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 更改默认IP地址
sed -i 's/192.168.1.1/192.168.50.101/g' package/base-files/files/bin/config_generate
# 清空登录密码
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify X86 Kernel 6.1
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
# 重新添加 luci-app-adbyby-plus-lite
#rm -rf feeds/luci/applications/luci-app-adbyby-plus
#git clone https://github.com/selfcan/luci-app-adbyby-plus-lite.git package/luci-app-adbyby-plus
#添加luci-app-netspeedtest
git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
#添加 luci-app-my-dnshelper
git clone https://github.com/selfcan/openwrt-my-dnshelper.git package/luci-app-my-dnshelper
#添加luci-app-filebrowser
git clone https://github.com/tcsr200722/luci-app-filebrowser.git package/luci-app-filebrowser
#git clone https://github.com/openwrt-xiaomi/luci-app-filebrowser.git package/luci-app-filebrowser
#git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser
#添加luci-app-dockerman
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
git clone https://github.com/lisaac/luci-lib-docker.git package/luci-lib-docker
#添加luci-app-argon-config
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
#添加luci-app-dnsfilter
#rm -rf feeds/luci/applications/luci-app-dnsfilter
#git clone https://github.com/kongfl888/luci-app-dnsfilter.git package/luci-app-dnsfilter
#添加luci-app-autotimeset
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
#添加luci-app-my-dnshelper
#git clone https://github.com/kongfl888/openwrt-my-dnshelper.git package/luci-app-my-dnshelper
#添加luci-app-easymesh
#git clone https://github.com/tcsr200722/luci-app-easymesh.git package/luci-app-easymesh
#添加luci-app-diskman
mkdir -p package/luci-app-diskman && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
#添加luci-app-oaf网络过滤
#git clone https://github.com/tcsr200722/OpenAppFilter.git package/luci-app-oaf
#添加luci-app-dockerman
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
#添加luci-app-gowebdav
git clone https://github.com/immortalwrt/openwrt-gowebdav.git package/luci-app-gowebdav
#添加luci-app-aliyundrive-webdav
#git clone https://github.com/tcsr200722/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav
#添加luci-app-jellyfin
git clone https://github.com/tcsr200722/luci-app-jellyfin.git package/luci-app-jellyfin
#添加luci-app-podminidlna
#git clone https://github.com/lisaac/luci-app-podminidlna.git package/luci-app-podminidlna
#添加luci-app-podsamba
#git clone https://github.com/lisaac/luci-app-podsamba.git package/luci-app-podsamba
#添加luci-app-alist
git clone https://github.com/sbwml/openwrt-alist.git package/luci-app-alist
# 重新添加 luci-app-netdata
rm -rf feeds/luci/applications/luci-app-netdata
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
#添加go-aliyun-webdav
git clone https://github.com/jerrykuku/go-aliyundrive-webdav.git
git clone https://github.com/jerrykuku/luci-app-go-aliyundrive-webdav.git package/luci-app-go-aliyundrive-webdav
add luci-app-argon-config
git clone https://github.com/selfcan/luci-app-argon-config.git  package/luci-app-argon-config
#添加luci-app-aliyundrive-fuse
git clone https://github.com/messense/aliyundrive-fuse.git package/luci-app-aliyundrive-fuse
#添加luci-app-bypass
# git clone https://github.com/kiddin9/openwrt-bypass.git package/luci-app-bypass
./scripts/feeds update -a
./scripts/feeds install -a