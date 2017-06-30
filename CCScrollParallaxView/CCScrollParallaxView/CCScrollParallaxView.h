//
//  CCScrollParallaxView.h
//  滚动视差
//
//  Created by ziooooo on 15/9/1.
//  Copyright (c) 2015年 ziooooo. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@class CCScrollParallaxItem,CCScrollParallaxView;

#pragma mark - CCScrollParallaxView

@protocol CCScrollParallaxViewDelegate <NSObject>

@optional

/**
 最后一页继续拖拽
 该方法执行一次
 
 @param scrollParallaxView
 */
-(void)cc_scrollParallaxViewLastPageStillDragging:(CCScrollParallaxView *)scrollParallaxView;

/**
 显示页面

 @param scrollParallaxView
 @param index 显示页面index
 */
-(void)cc_scrollParallaxView:(CCScrollParallaxView *)scrollParallaxView didShowPageWithIndex:(NSInteger)index;

@end

@interface CCScrollParallaxView : UIView

@property (weak ,nonatomic)id<CCScrollParallaxViewDelegate>delegate;

@property (weak ,nonatomic,readonly)UIScrollView *scrollView;

@property (strong ,nonatomic)NSArray *pageBackgroundImageArray;

@property (strong ,nonatomic ,readonly)NSArray *scrollParallaxItemArray;

/**
 显示在某个view

 @param view
 */
- (void)showToView:(UIView *)view;

/**
 添加一个item到scrollParallaxView
 
 @param item
 @param index 添加位置
 */
- (void)addScrollItem:(CCScrollParallaxItem *)item toIndex:(NSInteger)index;

/**
 添加一个item到scrollParallaxView

 @param item
 */
- (void)addScrollItem:(CCScrollParallaxItem *)item;

@end


#pragma mark - CCScrollParallaxItem

@interface CCScrollParallaxItem : UIButton

/**
 初始化item (淡入、延迟、飞入 效果)
 
 @param image 图片
 @param index 添加到index位置图片上
 @param frame 在所添加的图片上显示的位置
 @param multiple 偏移倍数 >= 1 控制速度
 @param angle 飞入角度
 @param allowFade 允许淡入
 @param duration 动画持续时间
 @param delay 延迟
 @return
 */
- (instancetype)initWithImage:(UIImage *)image
                    showFrame:(CGRect)frame
                     multiple:(CGFloat)multiple
                        angle:(CGFloat)angle
                    allowFade:(BOOL)allowFade
                     duration:(CGFloat)duration
                        delay:(CGFloat)delay;

/**
 初始化item (飞入效果)

 @param image 图片
 @param frame 在所添加的图片上显示的位置
 @param multiple 偏移倍数 >= 1 控制速度
 @param angle 飞入角度
 @return
 */
- (instancetype)initWithImage:(UIImage *)image
                    showFrame:(CGRect)frame
                     multiple:(CGFloat)multiple
                        angle:(CGFloat)angle;

/**
 初始化item (普通效果)
 
 @param image 图片
 @param frame 在所添加的图片上显示的位置
 @return
 */
- (instancetype)initWithImage:(UIImage *)image
                    showFrame:(CGRect)frame;

/**
 点击事件
 需要 weak self

 @param block
 */
-(void)onClickActionBlock:(void(^)())block;

/**
 显示在index页
 */
@property (assign ,nonatomic)NSInteger showToIndex;

/**
 所显示的位置
 */
@property (assign ,nonatomic)CGRect itemShowFrame;

/**
 偏移倍数
 >= 1 越大 出现速度越快
 */
@property (assign ,nonatomic)CGFloat gapMultiple;

/**
 飞入角度
 水平方向(1,0)方向为起点 逆时针旋转
 */
@property (assign ,nonatomic)CGFloat angle;

/**
 是否允许淡入
 */
@property (assign ,nonatomic)BOOL allowFade;

/**
 动画持续时间 
 > 0 时 item将不随scrollview滚动
 而是在其所在页面显示时，执行动画
 */
@property (assign ,nonatomic)CGFloat duration;

/**
 执行动画时的延迟
 当 duration > 0 时生效
 */
@property (assign ,nonatomic)CGFloat delay;


@end
