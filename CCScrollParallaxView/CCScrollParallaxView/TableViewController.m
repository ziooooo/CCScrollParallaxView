//
//  TableViewController.m
//  CCScrollParallaxView
//
//  Created by ziooooo on 2017/6/29.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ViewController *vc = segue.destinationViewController;
    vc.type = [segue.identifier integerValue];
    switch (vc.type) {
        case ExampleTypeNormal:
            vc.title = @"normal";
            break;
        case ExampleTypeScroll:
            vc.title = @"scroll";
            break;
        case ExampleTypeFade:
            vc.title = @"fade";
            break;
        case ExampleTypeDelay:
            vc.title = @"delay";
            break;
        case ExampleTypeComposite:
            vc.title = @"composite";
            break;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
