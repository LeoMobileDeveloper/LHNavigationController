//
//  LHNavigationController.h
//  LHNavigation
//
//  Created by huangwenchen on 16/6/20.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHBaseAnimator.h"

@protocol LHNavigationControllerDelegate <NSObject>
/**
 *  The view controller that after top most controller
 *
 *  @param controller top most controller
 *
 *  @return The viewController that use pop gesture to push
 */
- (UIViewController *)viewControllerAfterController:(UIViewController *)controller;
@end

@interface LHNavigationController : UINavigationController

/**
 *  Use this delegate to "pan left to push"
 */
@property (weak,nonatomic) id<LHNavigationControllerDelegate> lhDelegate;

@property (assign,nonatomic) LHNavigationTransitionStyle lh_transtionStyle;

@end
