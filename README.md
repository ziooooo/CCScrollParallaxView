# CCScrollParallaxView
### 一般适用于引导页，轻松添加简单动画。

## 安装
下载Demo

复制以下两个文件至所需工程目录下
>`CCScrollParallaxView.h`
>`CCScrollParallaxView.m`

## 使用效果

![image](https://github.com/ziooooo/CCScrollParallaxView/blob/master/eg.gif ) 

## 基本使用
1.创建`CCScrollParallaxView`实例

2.设置`pageBackgroundImageArray`背景图片数组，数组长度决定页数。

3.使用`CCScrollParallaxView: -showToView:`显示（至此就完成了普通的引导页）。

4.`CCScrollParallaxView`实例可承载多个`CCScrollParallaxItem`，创建`CCScrollParallaxItem`并设置属性，使用`CCScrollParallaxView: -addScrollItem: toIndex:`方法，添加item至`CCScrollParallaxView`。

5.滚动起来。

