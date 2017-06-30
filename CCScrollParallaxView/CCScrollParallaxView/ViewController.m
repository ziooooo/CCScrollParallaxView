//
//  ViewController.m
//  CCScrollParallaxView
//
//  Created by ziooooo on 15/9/25.
//  Copyright © 2015年 ziooooo. All rights reserved.
//

#import "ViewController.h"
#import "CCScrollParallaxView.h"


#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<CCScrollParallaxViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *bgImg = [UIImage new];
    
    //一些计算位置的过程
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
    
    //commonItem
    CCScrollParallaxItem *alertItem = [[CCScrollParallaxItem alloc] initWithImage:nil showFrame:CGRectMake(0, kScreenH - 200, kScreenW, 40)];
    alertItem.titleLabel.font = [UIFont systemFontOfSize:23];
    [alertItem setTitle:@"👈 Sliding Direction" forState:UIControlStateNormal];
    [alertItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    CCScrollParallaxItem *lastItem = [[CCScrollParallaxItem alloc] initWithImage:nil showFrame:CGRectMake(0, kScreenH - 150, kScreenW, 30)];
    lastItem.titleLabel.font = [UIFont systemFontOfSize:16];
    [lastItem setTitle:@"Last Page" forState:UIControlStateNormal];
    [lastItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    //setup ScrollParallaxView
    switch (self.type) {
        case ExampleTypeNormal:{
            CCScrollParallaxView *normalView = [[CCScrollParallaxView alloc]init];
            normalView.pageBackgroundImageArray = @[bgImg,bgImg];
            [normalView showToView:self.view];
            //add item
            [normalView addScrollItem:alertItem];
            [normalView addScrollItem:lastItem toIndex:1];
            
            CCScrollParallaxItem *item01 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF1];
            [normalView addScrollItem:item01 toIndex:1];
            
            CCScrollParallaxItem *item02 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF2];
            [normalView addScrollItem:item02 toIndex:1];
            
            CCScrollParallaxItem *item03 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF3];
            [normalView addScrollItem:item03 toIndex:1];
            
            CCScrollParallaxItem *item04 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF4];
            [normalView addScrollItem:item04 toIndex:1];
            
        }
            break;
        case ExampleTypeScroll:{
            CCScrollParallaxView *scrollView = [[CCScrollParallaxView alloc]init];
            scrollView.pageBackgroundImageArray = @[bgImg,bgImg,bgImg];
            [scrollView showToView:self.view];
            //add item
            [scrollView addScrollItem:alertItem];
            [scrollView addScrollItem:lastItem toIndex:2];
            
            CCScrollParallaxItem *item01 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF1 multiple:5 angle:0];
            [scrollView addScrollItem:item01 toIndex:1];
            
            CCScrollParallaxItem *item02 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF2 multiple:4 angle:0];
            [scrollView addScrollItem:item02 toIndex:1];
            
            CCScrollParallaxItem *item03 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF3 multiple:3 angle:0];
            [scrollView addScrollItem:item03 toIndex:1];
            
            CCScrollParallaxItem *item04 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF4 multiple:2 angle:0];
            [scrollView addScrollItem:item04 toIndex:1];
            
            //next page
            CCScrollParallaxItem *item11 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF1 multiple:5 angle:45];
            [scrollView addScrollItem:item11 toIndex:2];
            
            CCScrollParallaxItem *item12 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF2 multiple:4 angle:135];
            [scrollView addScrollItem:item12 toIndex:2];
            
            CCScrollParallaxItem *item13 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF3 multiple:3 angle:225];
            [scrollView addScrollItem:item13 toIndex:2];
            
            CCScrollParallaxItem *item14 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF4 multiple:2 angle:-45];
            [scrollView addScrollItem:item14 toIndex:2];
            
        }
            
            break;
        case ExampleTypeFade:{
            CCScrollParallaxView *fadeView = [[CCScrollParallaxView alloc]init];
            fadeView.pageBackgroundImageArray = @[bgImg,bgImg,bgImg];
            [fadeView showToView:self.view];
            //add item
            [fadeView addScrollItem:alertItem];
            [fadeView addScrollItem:lastItem toIndex:2];
            
            CCScrollParallaxItem *item01 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF1 multiple:1.4 angle:90 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item01 toIndex:1];
            
            CCScrollParallaxItem *item02 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF2 multiple:1.3 angle:90 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item02 toIndex:1];
            
            CCScrollParallaxItem *item03 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF3 multiple:1.2 angle:90 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item03 toIndex:1];
            
            CCScrollParallaxItem *item04 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF4 multiple:1.1 angle:90 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item04 toIndex:1];
            
            //next page
            CCScrollParallaxItem *item11 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF1 multiple:1 angle:60 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item11 toIndex:2];
            
            CCScrollParallaxItem *item12 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF2 multiple:1 angle:60 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item12 toIndex:2];
            
            CCScrollParallaxItem *item13 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF3 multiple:1 angle:60 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item13 toIndex:2];
            
            CCScrollParallaxItem *item14 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF4 multiple:1 angle:60 allowFade:YES duration:0 delay:0];
            [fadeView addScrollItem:item14 toIndex:2];
        }
            break;
        case ExampleTypeDelay:{
            CCScrollParallaxView *delayView = [[CCScrollParallaxView alloc]init];
            delayView.pageBackgroundImageArray = @[bgImg,bgImg,bgImg];
            [delayView showToView:self.view];
            //add item
            [delayView addScrollItem:alertItem];
            [delayView addScrollItem:lastItem toIndex:2];
            
            CCScrollParallaxItem *item01 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF1 multiple:1 angle:0 allowFade:YES duration:0.5 delay:0];
            [delayView addScrollItem:item01 toIndex:1];
            
            CCScrollParallaxItem *item02 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF2 multiple:1 angle:0 allowFade:YES duration:0.5 delay:0.1];
            [delayView addScrollItem:item02 toIndex:1];
            
            CCScrollParallaxItem *item03 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF3 multiple:1 angle:0 allowFade:YES duration:0.5 delay:0.2];
            [delayView addScrollItem:item03 toIndex:1];
            
            CCScrollParallaxItem *item04 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF4 multiple:1 angle:0 allowFade:YES duration:0.5 delay:0.3];
            [delayView addScrollItem:item04 toIndex:1];
            
            //next page
            CCScrollParallaxItem *item11 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF1 multiple:1.1 angle:60 allowFade:YES duration:0.4 delay:0];
            [delayView addScrollItem:item11 toIndex:2];
            
            CCScrollParallaxItem *item12 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF2 multiple:1.1 angle:60 allowFade:YES duration:0.5 delay:0];
            [delayView addScrollItem:item12 toIndex:2];
            
            CCScrollParallaxItem *item13 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF3 multiple:1.1 angle:60 allowFade:YES duration:0.6 delay:0];
            [delayView addScrollItem:item13 toIndex:2];
            
            CCScrollParallaxItem *item14 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"circle"] showFrame:circleF4 multiple:1.1 angle:60 allowFade:YES duration:0.7 delay:0];
            [delayView addScrollItem:item14 toIndex:2];
        }
            
            break;
        case ExampleTypeComposite:{
            CCScrollParallaxView *huluView = [[CCScrollParallaxView alloc]init];
            huluView.pageBackgroundImageArray = @[bgImg,bgImg];
            [huluView showToView:self.view];
            //add item
            [huluView addScrollItem:alertItem];
            
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

            CCScrollParallaxItem *hulu1 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"hulu1"] showFrame:hulu1Rect multiple:1.5 angle:90 allowFade:NO duration:0 delay:0];
            [huluView addScrollItem:hulu1 toIndex:1];
            
            CCScrollParallaxItem *hulu2 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"hulu2"] showFrame:hulu2Rect multiple:1.1 angle:50 allowFade:YES duration:0.2 delay:0.1];
            [huluView addScrollItem:hulu2 toIndex:1];
            
            CCScrollParallaxItem *hulu3 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"hulu3"] showFrame:hulu3Rect multiple:1.1 angle:120 allowFade:YES duration:0.2 delay:0];
            [huluView addScrollItem:hulu3 toIndex:1];
            
            CCScrollParallaxItem *hulu4 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"hulu4"] showFrame:hulu4Rect multiple:1 angle:0 allowFade:YES duration:0.5 delay:0.7];
            [huluView addScrollItem:hulu4 toIndex:1];
            
            CCScrollParallaxItem *hulu5 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"hulu5"] showFrame:hulu5Rect multiple:1 angle:0 allowFade:YES duration:0.5 delay:1.1];
            [huluView addScrollItem:hulu5 toIndex:1];
            
            CCScrollParallaxItem *hulu6 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"hulu6"] showFrame:hulu6Rect multiple:1 angle:0 allowFade:YES duration:0.5 delay:0.3];
            [huluView addScrollItem:hulu6 toIndex:1];
            
            CCScrollParallaxItem *hulu7 = [[CCScrollParallaxItem alloc] initWithImage:[UIImage imageNamed:@"hulu7"] showFrame:hulu7Rect multiple:1 angle:0 allowFade:YES duration:0.5 delay:0.9];
            [huluView addScrollItem:hulu7 toIndex:1];
            
            
            CCScrollParallaxItem *doneItem = [[CCScrollParallaxItem alloc] initWithImage:nil showFrame:CGRectMake(0, kScreenH - 150, kScreenW, 30)];
            [doneItem setTitle:@"The End" forState:UIControlStateNormal];
            [doneItem setTitleColor:[UIColor colorWithRed:18.0/255 green:106.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
            doneItem.titleLabel.font = [UIFont systemFontOfSize:18];
            [huluView addScrollItem:doneItem toIndex:1];
            
            __weak typeof(self) weakSelf = self;
            [doneItem onClickActionBlock:^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }];
            
        }
            break;
    }
    

}


@end
