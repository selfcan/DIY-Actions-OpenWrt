#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 取消插件注释
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default


# 添加插件源码
# sed -i '$a src-git ddnsto https://github.com/linkease/ddnsto-openwrt' feeds.conf.default
# sed -i '$a src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' feeds.conf.default
# sed -i '$a src-git dnsfilter https://github.com/garypang13/luci-app-dnsfilter' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default




# git clone https://github.com/CHN-beta/rkp-ipid package/rkp-ipid

# git clone https://github.com/Zxilly/UA2F package/UA2F

### 修改xiaomi R4 Breed直刷版
## 1.修改 mt7621_xiaomi_mi-router-4.dts
export shanchu1=$(grep  -a -n -e '&spi0 {' target/linux/ramips/dts/mt7621_xiaomi_mi-router-4.dts|cut -d ":" -f 1)
export shanchu2=$(grep  -a -n -e '&pcie {' target/linux/ramips/dts/mt7621_xiaomi_mi-router-4.dts|cut -d ":" -f 1)
export shanchu2=$(expr $shanchu2 - 1)
export shanchu2=$(echo $shanchu2"d")
sed -i $shanchu1,$shanchu2 target/linux/ramips/dts/mt7621_xiaomi_mi-router-4.dts
grep  -Pzo '&spi0[\s\S]*};[\s]*};[\s]*};[\s]*};' target/linux/ramips/dts/mt7621_xiaomi_mi-router-3g.dts > youhua.txt
echo "" >> youhua.txt
echo "" >> youhua.txt
export shanchu1=$(expr $shanchu1 - 1)
export shanchu1=$(echo $shanchu1"r")
sed -i "$shanchu1 youhua.txt" target/linux/ramips/dts/mt7621_xiaomi_mi-router-4.dts
rm -rf youhua.txt

# 添加第三方软件包
git clone https://github.com/riverscn/luci-app-omcproxy package/luci-app-omcproxy
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
