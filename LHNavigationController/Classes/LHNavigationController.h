//
//  LHNavigationController.h
//  LHNavigation
//
//  Created by huangwenchen on 16/6/20.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHBaseAnimator.h"
@import UIKit;
@protocol LHNavigationControllerDelegate <NSObject>
/**
 *  The view controller that after top most controller
 *
 *  @param controller top most controller
 *
 *  @return The viewController that use pop gesture to push
 */
- (UIViewController * _Nullable)viewControllerAfterController:(UIViewController * _Nullable)controller;
@end

@interface LHNavigationController : UINavigationController

/**
 *  Use this delegate to "pan left to push"
 */
@property (weak,nonatomic,nullable) id<LHNavigationControllerDelegate> lhDelegate;

@property (assign,nonatomic) LHNavigationTransitionStyle lh_transtionStyle;

@end
