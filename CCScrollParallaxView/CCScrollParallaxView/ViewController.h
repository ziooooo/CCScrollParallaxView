//
//  ViewController.h
//  CCScrollParallaxView
//
//  Created by ziooooo on 15/9/25.
//  Copyright © 2015年 ziooooo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,ExampleType) {
    ExampleTypeNormal = 0,
    ExampleTypeScroll ,
    ExampleTypeFade ,
    ExampleTypeDelay ,
    ExampleTypeComposite ,
    
};

@interface ViewController : UIViewController

@property (assign ,nonatomic)ExampleType type;

@end

