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
    self.lh_navigationItem.title = @"title";
    self.lh_navigationController.lhDelegate = self;
    self.barTintColor = [UIColor orangeColor];
    self.barItemsTintColor = [UIColor whiteColor];
    self.barTitlesTintColor = [UIColor whiteColor];
}
-(UIViewController *)viewControllerAfterController:(UIViewController *)controller{
    SecondViewController * dvc = [[SecondViewController alloc] init];
    return dvc;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
