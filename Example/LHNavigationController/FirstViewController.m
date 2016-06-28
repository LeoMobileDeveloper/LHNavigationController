//
//  FirstViewController.m
//  LHNavigationController
//
//  Created by huangwenchen on 16/6/26.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "FirstViewController.h"
#import "LHNavigationController.h"
#import "SecondViewController.h"

@interface FirstViewController ()<LHNavigationControllerDelegate>
@end
@implementation FirstViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.lh_navigationController.lh_transtionStyle = LHNavigationTransitionStyle3D;
    self.lh_navigationItem.title = @"Pan left";
    self.lh_navigationController.lhDelegate = self;
    self.barTintColor = [UIColor orangeColor];
    self.barItemsTintColor = [UIColor whiteColor];
    self.barTitlesTintColor = [UIColor whiteColor];
}
-(UIViewController *)viewControllerAfterController:(UIViewController *)controller{
//    if (controller == self) {
        SecondViewController * dvc = [[SecondViewController alloc] init];
        return dvc;
//    }
//    return nil;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
