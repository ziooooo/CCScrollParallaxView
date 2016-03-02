//
//  ViewController.m
//  CCScrollParallaxView
//
//  Created by ziooooo on 15/9/25.
//  Copyright © 2015年 ziooooo. All rights reserved.
//

#import "ViewController.h"
#import "CCScrollParallaxView.h"

//屏幕宽
#define kScreenW [UIScreen mainScreen].bounds.size.width
//屏幕高
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<CCScrollParallaxItemDelegate,CCScrollParallaxViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image1 = [UIImage imageNamed:@"first1"];
    UIImage *image2 = [UIImage imageNamed:@"first2"];
    UIImage *image3 = [UIImage imageNamed:@"first3"];
    UIImage *image4 = [UIImage imageNamed:@"first4"];
    UIImage *image5 = [UIImage imageNamed:@"first5"];
    
    CCScrollParallaxView *scrollParallaxView = [[CCScrollParallaxView alloc] init];
    scrollParallaxView.delegate = self;
    //图片数组图片数量决定滚动页数
    scrollParallaxView.imageArr = @[image1 ,image2 ,image3 ,image4 ,image5];
    [scrollParallaxView addToView:self.view];
    
    
    
    //圈size
    CGFloat circleWH = 80;
    //偏移量
    CGFloat circleSkew = 20;
    //四个圈的 origin
    //四个圈的 Y
    CGFloat circleY = 150;
    //四个圈的 X
    //圈2
    CGFloat circleX2 = kScreenW / 2 - circleWH + circleSkew / 2;
    //圈1
    CGFloat circleX1 = circleX2 - circleWH + circleSkew;
    //圈3
    CGFloat circleX3 = kScreenW / 2 - circleSkew / 2;
    //圈4
    CGFloat circleX4 = circleX3 + circleWH - circleSkew;
    //四个圈的 frame
    CGRect circleF1 = CGRectMake(circleX1, circleY, circleWH, circleWH);
    CGRect circleF2 = CGRectMake(circleX2, circleY, circleWH, circleWH);
    CGRect circleF3 = CGRectMake(circleX3, circleY, circleWH, circleWH);
    CGRect circleF4 = CGRectMake(circleX4, circleY, circleWH, circleWH);
    
    
    /**
     *  设置item  在 CCScrollParallaxView addToView 之后 addItem
     *
     *  @param imageName 图片名
     *  @param index     添加到index位置图片上
     *  @param frame     在所添加的图片上显示的位置
     *  @param multiple  item移动速度
     *  @param angle     出现/消失 角度
     */
    
    
    //第一页
    //箭头
    CGFloat arrowW = 50;
    CGFloat arrowH = 45;
    CGFloat arrowY = kScreenH - arrowH - 100;
    CGFloat arrowX = (kScreenW - arrowW) / 2;
    CCScrollParallaxItem *item00 = [[CCScrollParallaxItem alloc] initWithImageName:@"arrow" index:0 showFrame:CGRectMake(arrowX, arrowY, arrowW, arrowH) multiple:0];
    [scrollParallaxView addScrollItem:item00];
    //圈
    CCScrollParallaxItem *item01 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF1 multiple:1];
    
    [scrollParallaxView addScrollItem:item01];
    CCScrollParallaxItem *item02 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF2 multiple:1];
    
    [scrollParallaxView addScrollItem:item02];
    CCScrollParallaxItem *item03 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF3 multiple:1];
    
    [scrollParallaxView addScrollItem:item03];
    CCScrollParallaxItem *item04 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF4 multiple:1];
    
    [scrollParallaxView addScrollItem:item04];
    
    
    
    //第二页
    CCScrollParallaxItem *item11 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:1 showFrame:circleF1 multiple:5];
    
    [scrollParallaxView addScrollItem:item11];
    CCScrollParallaxItem *item12 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:1 showFrame:circleF2 multiple:4];
    
    [scrollParallaxView addScrollItem:item12];
    CCScrollParallaxItem *item13 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:1 showFrame:circleF3 multiple:3];
    
    [scrollParallaxView addScrollItem:item13];
    CCScrollParallaxItem *item14 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:1 showFrame:circleF4 multiple:2];
    
    [scrollParallaxView addScrollItem:item14];
    
    
    
    //第三页
    CCScrollParallaxItem *item21 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:2 showFrame:circleF1 multiple:5 angle:90];
    item21.allowFade = YES;
    [scrollParallaxView addScrollItem:item21];
    CCScrollParallaxItem *item22 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:2 showFrame:circleF2 multiple:4 angle:-90];
    item22.allowFade = YES;
    [scrollParallaxView addScrollItem:item22];
    CCScrollParallaxItem *item23 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:2 showFrame:circleF3 multiple:3 angle:90];
    item23.allowFade = YES;
    [scrollParallaxView addScrollItem:item23];
    CCScrollParallaxItem *item24 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:2 showFrame:circleF4 multiple:2 angle:-90];
    item24.allowFade = YES;
    [scrollParallaxView addScrollItem:item24];
    
    
    
    //第四页
    CCScrollParallaxItem *item31 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF1 multiple:3 angle:30];
    item31.allowFade = YES;
    item31.delay = 0.2;
    [scrollParallaxView addScrollItem:item31];
    CCScrollParallaxItem *item32 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF2 multiple:4 angle:100];
    item32.allowFade = YES;
    item32.delay = 0.3;
    [scrollParallaxView addScrollItem:item32];
    CCScrollParallaxItem *item33 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF3 multiple:5 angle:223];
    item33.allowFade = YES;
    item33.delay = 0.4;
    [scrollParallaxView addScrollItem:item33];
    CCScrollParallaxItem *item34 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF4 multiple:2 angle:311];
    item34.allowFade = YES;
    item34.delay = 0.5;
    [scrollParallaxView addScrollItem:item34];
    
    //第五页 - 葫芦娃 
    //第一个葫芦娃的位置
    CGFloat huluW = 140;
    CGFloat huluH = 114.7;
    
    CGFloat hulu1Y = 70;
    CGFloat hulu1X = (kScreenW - huluW) / 2;
    CGRect hulu1Rect = CGRectMake(hulu1X, hulu1Y, huluW, huluH);
    //第二个
    CGFloat hulu2Y = CGRectGetMaxY(hulu1Rect) - 50;
    CGFloat hulu2X = hulu1X - 50;
    CGRect hulu2Rect = CGRectMake(hulu2X, hulu2Y, huluW, huluH);
    //第三个
    CGFloat hulu3Y = hulu2Y;
    CGFloat hulu3X = CGRectGetMaxX(hulu1Rect) - 90;
    CGRect hulu3Rect = CGRectMake(hulu3X, hulu3Y, huluW, huluH);
    //第四个
    CGFloat hulu4Y = CGRectGetMaxY(hulu2Rect) - 40;
    CGFloat hulu4X = hulu2X - 40;
    CGRect hulu4Rect = CGRectMake(hulu4X, hulu4Y, huluW, huluH);
    //第五个
    CGFloat hulu5Y = hulu4Y;
    CGFloat hulu5X = hulu4X + 60;
    CGRect hulu5Rect = CGRectMake(hulu5X, hulu5Y, huluW, huluH);
    //第六个
    CGFloat hulu6Y = hulu4Y;
    CGFloat hulu6X = hulu5X + 60;
    CGRect hulu6Rect = CGRectMake(hulu6X, hulu6Y, huluW, huluH);
    //第七个
    CGFloat hulu7Y = hulu4Y;
    CGFloat hulu7X = hulu6X + 60;
    CGRect hulu7Rect = CGRectMake(hulu7X, hulu7Y, huluW, huluH);
    
    CCScrollParallaxItem *hulu1 = [[CCScrollParallaxItem alloc] initWithImageName:@"hulu1" index:4 showFrame:hulu1Rect multiple:1.5 angle:90];
    hulu1.allowFade = YES;
    hulu1.delay = 0.3;
    [scrollParallaxView addScrollItem:hulu1];
    CCScrollParallaxItem *hulu2 = [[CCScrollParallaxItem alloc] initWithImageName:@"hulu2" index:4 showFrame:hulu2Rect multiple:1.5 angle:50];
    hulu2.allowFade = YES;
    hulu2.delay = 0.4;
    [scrollParallaxView addScrollItem:hulu2];
    CCScrollParallaxItem *hulu3 = [[CCScrollParallaxItem alloc] initWithImageName:@"hulu3" index:4 showFrame:hulu3Rect multiple:1.5 angle:120];
    hulu3.allowFade = YES;
    hulu3.delay = 0.55;
    [scrollParallaxView addScrollItem:hulu3];
    CCScrollParallaxItem *hulu4 = [[CCScrollParallaxItem alloc] initWithImageName:@"hulu4" index:4 showFrame:hulu4Rect multiple:1.5 angle:200];
    hulu4.allowFade = YES;
    hulu4.delay = 0.7;
    [scrollParallaxView addScrollItem:hulu4];
    CCScrollParallaxItem *hulu5 = [[CCScrollParallaxItem alloc] initWithImageName:@"hulu5" index:4 showFrame:hulu5Rect multiple:1.5 angle:-120];
    hulu5.allowFade = YES;
    hulu5.delay = 0.8;
    [scrollParallaxView addScrollItem:hulu5];
    CCScrollParallaxItem *hulu6 = [[CCScrollParallaxItem alloc] initWithImageName:@"hulu6" index:4 showFrame:hulu6Rect multiple:1.5 angle:-60];
    hulu6.allowFade = YES;
    hulu6.delay = 0.95;
    [scrollParallaxView addScrollItem:hulu6];
    CCScrollParallaxItem *hulu7 = [[CCScrollParallaxItem alloc] initWithImageName:@"hulu7" index:4 showFrame:hulu7Rect multiple:1.5 angle:-10];
    hulu7.allowFade = YES;
    hulu7.delay = 1.0;
    [scrollParallaxView addScrollItem:hulu7];
    
    
    //完成
    CCScrollParallaxItem *item35 = [[CCScrollParallaxItem alloc] initWithImageName:@"done" index:4 showFrame:CGRectMake(arrowX, arrowY, 60, 60) multiple:1];
    item35.delegate = self;
    [scrollParallaxView addScrollItem:item35];
    
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenH - 70, kScreenW, 50)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"CCScrollParallaxView";
    titleLabel.font = [UIFont boldSystemFontOfSize:30];
    titleLabel.userInteractionEnabled = NO;
    [scrollParallaxView addSubview:titleLabel];
}

#pragma mark - 监听item点击事件
-(void)CCScrollParallaxItemClickItem:(CCScrollParallaxItem *)item
{
    [self alert];
}
#pragma mark - CCScrollParallaxView delegate
//滚动到最后触发事件
-(void)CCScrollParallaxViewWillScrollEnd:(CCScrollParallaxView *)CCScrollParallaxView
{
    //    [self alert];
}

-(void)alert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"做你想做的" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


@end
