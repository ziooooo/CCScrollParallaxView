//
//  CCScrollParallaxView.m
//  滚动视差
//
//  Created by ziooooo on 15/9/1.
//  Copyright (c) 2015年 ziooooo. All rights reserved.
//

#import "CCScrollParallaxView.h"
#define angle2Radian(angle)  ((angle)/180.0*M_PI)
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define kTempSpan 10

@interface CCScrollParallaxView()<UIScrollViewDelegate>

@property (weak ,nonatomic,readwrite)UIScrollView *scrollView;
/**
 *  保存每次滚动后contentOffset.x 辅助计算滚动间距
 */
@property (assign ,nonatomic)CGFloat tempX;

@property (strong ,nonatomic ,readwrite)NSMutableArray *itemArray;
/**
 *  当前是否正向滚动
 */
@property (assign ,nonatomic)BOOL scrollForward;

@end

@implementation CCScrollParallaxView
-(NSMutableArray *)itemArray
{
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.showsVerticalScrollIndicator=NO;
        scrollView.pagingEnabled=YES;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        self.scrollView = scrollView;
    }
    return self;
}

-(void)addToView:(UIView *)view
{
    //设置frame
    CGSize imageSize = [self setFrameToView:view];
    //设置图片
    for (int i = 0;i < self.imageArr.count ; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i * imageSize.width, 0, imageSize.width, imageSize.height)];
        imageView.image = self.imageArr[i];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.scrollView addSubview:imageView];
    }
    //设置scrollview
    self.scrollView.contentSize=CGSizeMake(imageSize.width * self.imageArr.count, imageSize.height);
    
    [view addSubview:self];
}

-(CGSize)setFrameToView:(UIView *)view
{
    self.frame = view.bounds;
    self.scrollView.frame = self.bounds;
    return view.frame.size;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollX = scrollView.contentOffset.x;
    //每次滚动间距
    CGFloat offset = scrollX - self.tempX;
    
    self.tempX = scrollX;
    
    for (CCScrollParallaxItem *item in self.itemArray) {
        [self scrollWithScrollParallaxItem:item offset:offset scrollX:scrollX];
    }
}

-(void)scrollWithScrollParallaxItem:(CCScrollParallaxItem *)item offset:(CGFloat)offset scrollX:(CGFloat)scrollX
{
    self.scrollForward = offset > 0;
    
    if (item.delay > 0 && scrollX > (item.showToIndex - 1) * self.scrollView.frame.size.width && scrollX < (item.showToIndex + 1) * self.scrollView.frame.size.width && item.gapMultiple != 1) return;
    if (item.allowFade && item.gapMultiple != 1 && item.delay == 0) { //滑动时改变透明度
        
        if (CGRectIntersectsRect(self.bounds, item.frame)) {
            if (CGRectEqualToRect(item.whenShowFrame, CGRectZero)) {
                item.whenShowFrame = item.frame;
            }
            
            CGPoint currentPoint = item.frame.origin;
            CGPoint showPoint = item.itemShowFrame.origin;
            CGPoint whenShowPoint = item.whenShowFrame.origin;
            
            CGFloat alphaD = [self sideWithFirstPoint:whenShowPoint secondPoint:showPoint];
            CGFloat alphaN = alphaD - [self sideWithFirstPoint:showPoint secondPoint:currentPoint];
            item.alpha = alphaN / alphaD;
        }
        
    }
    
    [self setScrollScrollParallaxItem:item withOffset:offset];
    
}
//设置scroll item 位置
-(void)setScrollScrollParallaxItem:(CCScrollParallaxItem *)item withOffset:(CGFloat)offset
{
    CGRect temp = item.frame;
    //计算每次item移动后的 frame
    temp.origin.x -= (offset * item.gapMultiple * item.xMoveRatio);
    temp.origin.y += (offset * item.gapMultiple * item.yMoveRatio);
    item.frame = temp;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x + scrollView.frame.size.width >= scrollView.contentSize.width) {
        //滚动到最后
        if ([self.delegate respondsToSelector:@selector(CCScrollParallaxViewWillScrollEnd:)]) {
            [self.delegate CCScrollParallaxViewWillScrollEnd:self];
        }
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //判断当前图片位置
    int curIndex = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
    for (CCScrollParallaxItem *item in self.itemArray) {
        if (!item.delay) continue;
        if (item.showToIndex == curIndex) {//取出item
            item.alpha = !item.allowFade;
            [UIView animateWithDuration:item.delay animations:^{
                item.frame = item.itemShowFrame;
                item.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    //判断当前图片位置
    int curIndex = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
    for (CCScrollParallaxItem *item in self.itemArray) {
        if (!item.delay) continue;
        if (item.showToIndex == curIndex) {//取出item
            item.alpha = 1;
            [UIView animateWithDuration:0.2 animations:^{
                if (item.allowFade) {
                    item.alpha = 0;
                }
            } completion:^(BOOL finished) {
                item.alpha = 0;
                if (item.gapMultiple == 1) {
                    return ;
                }
                CGFloat offset;
                if (self.scrollForward) {
                    offset = scrollView.frame.size.width;
                }
                else{
                    offset = -scrollView.frame.size.width;
                }
                [self setScrollScrollParallaxItem:item withOffset:offset];
                
            }];
        }
    }
}

-(void)addScrollItem:(CCScrollParallaxItem *)item
{
    //防止越界
    if (item.showToIndex + 1 > self.imageArr.count) {
        return;
    }
    item.alpha = !item.allowFade;
    //item偏移距离
    CGFloat itemSkewSpan = [self itemSkewWithItem:item];
    //item计算角度后偏移位置
    CGPoint itemOrigin = [self newPointWithAngle:item.angle oldPoint:item.itemShowFrame.origin skewX:itemSkewSpan];
    //分别计算x y移动比例
    CGFloat itemSkewX = itemOrigin.x - item.itemShowFrame.origin.x;
    CGFloat itemSkewY = itemOrigin.y - item.itemShowFrame.origin.y;
    item.xMoveRatio = itemSkewX / itemSkewSpan;
    item.yMoveRatio = -itemSkewY / itemSkewSpan;
    
    //特殊情况
    CGPoint tempPoint;
    CGFloat tempSkewSpan = kTempSpan;
    if (itemSkewSpan == 0) {//在第一页时 item偏移距离为0 计算x y的移动比例
        //模拟偏移位置为10
        tempPoint = [self newPointWithAngle:item.angle oldPoint:item.itemShowFrame.origin skewX:tempSkewSpan];
        itemSkewX = tempPoint.x - item.itemShowFrame.origin.x;
        itemSkewY = tempPoint.y - item.itemShowFrame.origin.y;
        item.xMoveRatio = itemSkewX / tempSkewSpan;
        item.yMoveRatio = -itemSkewY / tempSkewSpan;
    }
    
    CGFloat itemW = item.itemShowFrame.size.width;
    CGFloat itemH = item.itemShowFrame.size.height;
    //设置最后的frame
    item.frame = CGRectMake(itemOrigin.x, itemOrigin.y, itemW, itemH);
    
    [self addSubview:item];
    [self.itemArray addObject:item];
    
    
}
//item偏移距离
-(CGFloat)itemSkewWithItem:(CCScrollParallaxItem *)item
{
    return (item.showToIndex * self.scrollView.frame.size.width) * item.gapMultiple;
}

#pragma mark - 根据角度算新的点
//以旧点 水平方向(1,0)方向为起点 逆时针旋转
-(CGPoint)newPointWithAngle:(CGFloat)angle oldPoint:(CGPoint)point skewX:(CGFloat)skewSpan;
{
    CGFloat skewX = [self xSideWithAngle:angle otherSide:skewSpan];
    CGFloat skewY = [self ySideWithAngle:angle otherSide:skewSpan];
    CGFloat pointX = point.x + skewX;
    CGFloat pointY = point.y - skewY;
    
    return CGPointMake(pointX, pointY);
}
//偏移后点的Y值
-(CGFloat)ySideWithAngle:(CGFloat)angele otherSide:(CGFloat)otherSide
{
    return [self sideWithCurrentAngle:angele otherSide:otherSide otherAngle:90];
}
//偏移后点的X值
-(CGFloat)xSideWithAngle:(CGFloat)angele otherSide:(CGFloat)otherSide
{
    return [self ySideWithAngle:90 - angele otherSide:otherSide];
}

//根据角度计算距离
-(CGFloat)sideWithCurrentAngle:(CGFloat)angel otherSide:(CGFloat)otherSide otherAngle:(CGFloat)otherAngle
{
    return (otherSide * sin(angle2Radian(angel)))  / sin(angle2Radian(otherAngle));
}

//计算两点间的距离
-(CGFloat)sideWithFirstPoint:(CGPoint)fPoint secondPoint:(CGPoint)sPoint
{
    return  sqrt(pow(fPoint.x - sPoint.x, 2) + pow(fPoint.y - sPoint.y, 2));
}

@end


#pragma mark - item

@implementation CCScrollParallaxItem
- (instancetype)initWithImageName:(NSString *)imageName index:(NSInteger)index showFrame:(CGRect)frame multiple:(CGFloat)multiple
{
    return [self initWithImageName:imageName index:index showFrame:frame multiple:multiple angle:0];
}

-(instancetype)initWithImageName:(NSString *)imageName index:(NSInteger)index showFrame:(CGRect)frame multiple:(CGFloat)multiple angle:(CGFloat)angle
{
    if (self = [super init]) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        self.userInteractionEnabled = NO;
        self.showToIndex = index;
        self.itemShowFrame = frame;
        self.gapMultiple = multiple;
        self.angle = angle;
        [self addTarget:self action:@selector(clickItem) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)setGapMultiple:(CGFloat)gapMultiple
{
    if (gapMultiple < 1) {
        _gapMultiple = 1;
    }
    else{
        _gapMultiple = gapMultiple;
    }
}
-(void)setDelegate:(id<CCScrollParallaxItemDelegate>)delegate
{
    _delegate = delegate;
    //设置代理时同时设置，保证可以监听点击事件
    self.userInteractionEnabled = YES;
}
//取消高亮
-(void)setHighlighted:(BOOL)highlighted
{
    
}
-(void)clickItem
{
    if ([self.delegate respondsToSelector:@selector(CCScrollParallaxItemClickItem:)]) {
        [self.delegate CCScrollParallaxItemClickItem:self];
    }
}

@end
