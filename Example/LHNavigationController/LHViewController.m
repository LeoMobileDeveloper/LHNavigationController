//
//  LHViewController.m
//  LHNavigationController
//
//  Created by Leo on 06/21/2016.
//  Copyright (c) 2016 Leo. All rights reserved.
//

#import "LHViewController.h"
#import "LHNavigationController.h"

@interface LHViewController ()<LHNavigationControllerDelegate>

@end

@implementation LHViewController

- (UIViewController *)viewControllerAfterController:(UIViewController *)controller{
    if (controller == self) {
        UIViewController * nvc = [[UIViewController alloc] init];
        nvc.view.backgroundColor = [UIColor greenColor];
        return nvc;
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    LHNavigationController * nav = (LHNavigationController *)self.navigationController;
    nav.lhDelegate = self;
}

@end
