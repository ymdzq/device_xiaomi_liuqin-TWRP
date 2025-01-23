# TWRP 小米平板6 Pro系列
基于[红米K60橙狐设备树](https://github.com/ymdzq/OFRP-device_xiaomi_mondrian)修改的TWRP设备树  
参考了sk佬[小米12S twrp设备树](https://github.com/sekaiacg/TWRP_android_device_xiaomi_mayfly)，试图把小米平板6 Pro（liuqin）、小米平板6 Max 14（yudi）都放进来  
# 目前进度
liuqin基本功能可用，解密安卓15澎湃OS2.0的data分区正常，触摸控制正常，并且可以正常刷入HyperOS完整包  
yudi无设备所以未测试  
# 如何使用
进入[Release](https://github.com/ymdzq/device_xiaomi_liuqin-TWRP/releases)中，根据标题上的twrp_liuqin、twrp_yudi区分机型，点开Assets选项，点击recovery.img文件名下载  
已root平板可以通过爱玩机工具箱、搞机助手等app直接写入recovery分区  
也可以平板连接电脑线刷，请自备[fastboot工具](https://developer.android.google.cn/studio/releases/platform-tools?hl=zh-cn)，手动重启平板至bootloader模式（橙色fastboot字样）  
使用fastboot工具把rec镜像刷入ab两槽的rec分区，重启进入rec，命令：  
```bash
fastboot flash recovery_a recovery.img
fastboot flash recovery_b recovery.img
fastboot reboot recovery
```
# 如何构建
下载TWRP源代码，然后用repopick给TWRP源代码打上7679..7683系列补丁，  
偷懒可以直接用[skkk修改的twrp](https://github.com/sekaiacg/twrp_recovery)或者[余空修改的twrp](https://github.com/YuKongA/android_bootable_recovery)替换~/twrp/bootable/recovery文件夹，  
克隆这个仓库放到相应的位置  
例如TWRP源代码根目录为~/twrp，则保存为~/twrp/device/xiaomi/liuqin/:  
```bash
cd ~/twrp
mkdir -p device/xiaomi
cd device/xiaomi
git clone https://github.com/ymdzq/device_xiaomi_liuqin-TWRP.git liuqin
```
bootctrl需要从默认a12.1分支改成a14分支然后重新repo sync拉取  
修改~/twrp/.repo/manifests/twrp-default.xml，第99行  
```
    <project name="android_hardware_qcom_bootctrl" path="hardware/qcom-caf/bootctrl" remote="LineageOS" revision="lineage-19.1-caf" />
```
修改为  
```
    <project name="android_hardware_qcom_bootctrl" path="hardware/qcom-caf/bootctrl" remote="LineageOS" revision="lineage-21.0-caf" />
```
打开源代码根目录按设备选择运行:  
小米平板6Pro（liuqin）
```bash
. build/envsetup.sh && lunch twrp_liuqin-eng && mka recoveryimage
```
小米平板6 Max 14（yudi）
```bash
. build/envsetup.sh && lunch twrp_yudi-eng && mka recoveryimage
```
