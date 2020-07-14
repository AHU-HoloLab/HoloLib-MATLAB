# 全息实验函数库
![](https://img.shields.io/badge/build-passing-brightgreen)
![](https://img.shields.io/badge/language-MATLAB-orange)
![](https://img.shields.io/badge/license-GPLv3-lightgrey)


## 项目简介

计算全息 MATLAB 算法库，简化计算全息编程。

## 功能特性

MATLAB 源代码存放在 `source` 目录内

``` MATLAB
Initialization_Path.m   % 将HoloLib添加到MATLIB搜索路径
copyMakeBorder.m        % 扩充图像边界 超过图像区域补零
expandMAT.m             % 对矩阵行向和列向扩展
getAxilens.m            % 获取大焦比轴锥透镜相位
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
getColorHologram.m		% 获取彩色全息图
```
`使用范例`  存放代码使用例子
`image`    存放测试图像

## 部署步骤
- 将 `HoloLib_MATLAB\source` 文件夹添加到MATLAB搜索路径
- 将 `HoloLib_MATLAB\iamge`  件夹添加到MATLAB搜索路径

## 协议

* GNU GPLv3

## P.S.
* GB2312
