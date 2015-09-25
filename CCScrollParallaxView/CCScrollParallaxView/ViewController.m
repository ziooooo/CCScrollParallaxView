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
    
    CCScrollParallaxView *scrollParallaxView = [[CCScrollParallaxView alloc] init];
    scrollParallaxView.delegate = self;
    //图片数组图片数量决定滚动页数
    scrollParallaxView.imageArr = @[image1 ,image2 ,image3 ,image4];
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
    CCScrollParallaxItem *item01 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF1 multiple:0];
    [scrollParallaxView addScrollItem:item01];
    CCScrollParallaxItem *item02 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF2 multiple:0];
    [scrollParallaxView addScrollItem:item02];
    CCScrollParallaxItem *item03 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF3 multiple:0];
    [scrollParallaxView addScrollItem:item03];
    CCScrollParallaxItem *item04 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:0 showFrame:circleF4 multiple:0];
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
    [scrollParallaxView addScrollItem:item21];
    CCScrollParallaxItem *item22 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:2 showFrame:circleF2 multiple:4 angle:-90];
    [scrollParallaxView addScrollItem:item22];
    CCScrollParallaxItem *item23 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:2 showFrame:circleF3 multiple:3 angle:90];
    [scrollParallaxView addScrollItem:item23];
    CCScrollParallaxItem *item24 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:2 showFrame:circleF4 multiple:2 angle:-90];
    [scrollParallaxView addScrollItem:item24];
    
    
    
    //第四页
    CCScrollParallaxItem *item31 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF1 multiple:3 angle:30];
    [scrollParallaxView addScrollItem:item31];
    CCScrollParallaxItem *item32 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF2 multiple:4 angle:100];
    [scrollParallaxView addScrollItem:item32];
    CCScrollParallaxItem *item33 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF3 multiple:5 angle:223];
    [scrollParallaxView addScrollItem:item33];
    CCScrollParallaxItem *item34 = [[CCScrollParallaxItem alloc] initWithImageName:@"circle" index:3 showFrame:circleF4 multiple:2 angle:311];
    [scrollParallaxView addScrollItem:item34];
    
    //完成
    CCScrollParallaxItem *item35 = [[CCScrollParallaxItem alloc] initWithImageName:@"done" index:3 showFrame:CGRectMake(arrowX, arrowY, 60, 60) multiple:0];
    item35.delegate = self;
    [scrollParallaxView addScrollItem:item35];
    
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, kScreenW, 50)];
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
    [self alert];
}

-(void)alert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"做你想做的" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


@end
