# 全息实验函数库
![](https://img.shields.io/badge/build-passing-brightgreen)
![](https://img.shields.io/badge/language-MATLAB-orange)
![](https://img.shields.io/badge/license-GPLv3-lightgrey)


## 项目简介

将计算全息显示基础算法整理为MATLAB功能函数，简化计算全息功能实现。

## 功能特性
```matlab
Initialization_Path.m   % 将HoloLib添加到MATLIB搜索路径
copyMakeBorder.m        % 扩充图像边界 超过图像区域补零
expandMAT.m             % 对矩阵行向和列向扩展
getAxilens.m            % 获取轴锥透镜相位
getBlaze.m              % 获取闪耀光栅相位
getLens.m               % 获取菲涅尔球面透镜相位
iterFourier.m           % 迭代傅里叶算法
iterFresnel.m           % 迭代菲涅尔算法
propDFFT.m              % 菲涅尔传播-两次傅里叶计算法方法
propTFFT.m              % 菲涅尔传播-三次傅里叶计算法方法
propDOE.m               % DOE元件菲涅尔传播
recFourier.m            % 迭代傅里叶计算重构
recFresnel.m            % 迭代菲涅尔计算重构
repImage.m              % 图像重复拼接
savePhase.m             % 保存相位图
showLCOS.m              % 将相位图显示在LCoS上（仅支持MATLAB R2018b及以上版本）
showPhase.m             % 相位显示
stepPhase.m             % 相位分阶函数
writeFDTD.m             % FDTD Solutions 仿真文件数据导出
```
./Sample 存放功能示例代码

## 部署步骤
- 将 HoloLib 文件夹添加到MATLAB搜索路径
- 将 HoloLib\image 文件夹添加到MATLAB搜索路径

## 版本内容更新
### v1.0.1 (2019/11/08)
- 删除作者信息注释
- 修正部分帮助信息错误
- 修正 repImage() 函数失效错误
- showLCoS() 函数仅支持MATLAB R2018b及以上版本
- 删除 cprintf() 函数
- 修改和添加功能示例代码
- 增加计算进度条显示
### v1.0.0 (2019/10/29)
- 发布初始版本
- 添加README
## 协议

* GNU GPLv3

## P.S.
* GB2312