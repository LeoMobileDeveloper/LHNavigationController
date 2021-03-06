//
//  FirstViewController.m
//  LHNavigationController
//
//  Created by huangwenchen on 16/6/26.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "FirstViewController.h"
#import "LHNavigation.h"
#import "SecondViewController.h"

@interface FirstViewController ()<LHNavigationControllerDelegate>
@end
@implementation FirstViewController

-(void)viewDidLoad{
    [super viewDidLoad];
//    self.lh_navigationController.lh_transtionStyle = LHNavigationTransitionStyle3D;
    self.lh_navigationItem.title = @"Pan left";
    self.lh_navigationController.lhDelegate = self;
    self.lh_barTintColor = [UIColor orangeColor];
    self.lh_barItemsTintColor = [UIColor whiteColor];
    self.lh_barTitlesTintColor = [UIColor whiteColor];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(toNext)];
    self.lh_navigationItem.rightBarButtonItem = rightItem;
}
- (void)toNext{
    SecondViewController * dvc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:dvc animated:YES];
}
-(UIViewController *)viewControllerAfterController:(UIViewController *)controller{
    if (controller == self) {
        SecondViewController * dvc = [[SecondViewController alloc] init];
        return dvc;
    }
    return nil;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
