# CCScrollParallaxView

# 滚动视差

## 可用于欢迎页

![image](https://github.com/ziooooo/CCScrollParallaxView/blob/master/123.gif ) 

### 基本用法
    1.创建CCScrollParallaxView实例，设置滚动图片，图片数量等于页数。
    2.添加CCScrollParallaxView实例，设置item在CCScrollParallaxView addToView:之后。
    3.设置item的属性：
        /**
        *  显示在哪个滚动图片上 根据index
        */
        @property (assign ,nonatomic)NSInteger showToIndex;
        /**
        *  显示的位置
        */
        @property (assign ,nonatomic)CGRect itemShowFrame;
        /**
        *  距离的倍数 控制视差 >= 1 控制速度
        */
        @property (assign ,nonatomic)CGFloat gapMultiple;
        /**
        *  角度 水平方向(1,0)方向为起点 逆时针旋转
        */
        @property (assign ,nonatomic)CGFloat angle;
        /**
        *  延迟时间 0为不延迟
        */
        @property (assign ,nonatomic)CGFloat delay;
        /**
        *  淡出淡入
        */
        @property (assign ,nonatomic)BOOL allowFade;