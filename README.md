# TWRP 小米平板6 Pro系列
基于[红米K60橙狐设备树](https://github.com/ymdzq/OFRP-device_xiaomi_mondrian)修改的TWRP设备树  
参考了sk佬[小米12S twrp设备树](https://github.com/sekaiacg/TWRP_android_device_xiaomi_mayfly)，试图把小米平板6 Pro（liuqin）、小米平板6 Max 14（yudi）都放进来  
liuqin、yudi无设备所以未测试  

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
打开源代码根目录按设备选择运行:  
小米平板6Pro（liuqin）
```bash
. build/envsetup.sh && lunch twrp_liuqin-eng && mka recoveryimage
```
小米平板6 Max 14（yudi）
```bash
. build/envsetup.sh && lunch twrp_yudi-eng && mka recoveryimage
```
