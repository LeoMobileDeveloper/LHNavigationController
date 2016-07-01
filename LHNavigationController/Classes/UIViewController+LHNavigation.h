//
//  UIViewController+LHNavigation.h
//  Pods
//
//  Created by huangwenchen on 16/7/1.
//
//

#import <UIKit/UIKit.h>
#import "LHNavigationController.h"

@interface UIViewController (LHNavigation)

@property (strong,nonatomic)UIColor * lh_barTintColor;

@property (strong,nonatomic)UIColor * lh_barItemsTintColor;

@property (strong,nonatomic)UIColor * lh_barTitlesTintColor;

@property (strong,nonatomic,readonly)LHNavigationController * lh_navigationController;

@end
