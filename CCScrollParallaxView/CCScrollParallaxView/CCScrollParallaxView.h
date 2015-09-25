//
//  CCScrollParallaxView.h
//  滚动视差
//
//  Created by ziooooo on 15/9/1.
//  Copyright (c) 2015年 ziooooo. All rights reserved.
//  问题请联系QQ:54540908
//

#import <UIKit/UIKit.h>

@class CCScrollParallaxItem,CCScrollParallaxView;

@protocol CCScrollParallaxViewDelegate <NSObject>

@optional
/**
 *  滚动到最后
 *
 *  @param CCScrollParallaxView
 */
-(void)CCScrollParallaxViewWillScrollEnd:(CCScrollParallaxView *)scrollParallaxView;

@end

@interface CCScrollParallaxView : UIView

@property (weak ,nonatomic)id<CCScrollParallaxViewDelegate>delegate;
/**
 *  上面的scrollview
 */
@property (weak ,nonatomic,readonly)UIScrollView *scrollView;
/**
 *  图片数组 决定滚动页数
 */
@property (strong ,nonatomic)NSArray *imageArr;
/**
 *  item数组
 */
@property (strong ,nonatomic ,readonly)NSMutableArray *itemArray;

/**
 *  显示在某个view
 *
 *  @param view view
 */
- (void)addToView:(UIView *)view;
/**
 *  添加一个item到scrollParallaxView
 *
 *  @param item
 */
- (void)addScrollItem:(CCScrollParallaxItem *)item;

@end


@protocol CCScrollParallaxItemDelegate <NSObject>

@optional
/**
 *  点击了item
 *
 *  @param item item
 */
- (void)CCScrollParallaxItemClickItem:(CCScrollParallaxItem *)item;

@end
@interface CCScrollParallaxItem : UIButton

@property (weak ,nonatomic)id<CCScrollParallaxItemDelegate>delegate;
/**
 *  初始化item
 *
 *  @param imageName 图片名
 *  @param index     添加到index位置图片上
 *  @param frame     在所添加的图片上显示的位置
 *  @param multiple  滚动速度
 *  @param angle     出现/消失 角度
 *
 *  @return
 */
- (instancetype)initWithImageName:(NSString *)imageName index:(NSInteger)index showFrame:(CGRect)frame multiple:(CGFloat)multiple angle:(CGFloat)angle;
/**
 *  初始化item
 *
 *  @param imageName 图片名
 *  @param index     添加到index位置图片上
 *  @param frame     在所添加的图片上显示的位置
 *  @param multiple  滚动速度
 *
 *  @return
 */
- (instancetype)initWithImageName:(NSString *)imageName index:(NSInteger)index showFrame:(CGRect)frame multiple:(CGFloat)multiple;

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


//xMoveRatio yMoveRatio 传递参数 无需设置
@property (assign ,nonatomic)CGFloat xMoveRatio;
@property (assign ,nonatomic)CGFloat yMoveRatio;

@end