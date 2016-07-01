//
//  LHNavAnimator.m
//  LHNavigation
//
//  Created by huangwenchen on 16/6/20.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "LHDefaultAnimator.h"
#import "UIViewController+LHNavigation.h"

@implementation LHDefaultAnimator
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //Get views and vcs
    UIViewController * fromvc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * tovc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * fromView = fromvc.view;
    UIView * toView = tovc.view;
    UIView * containView = [transitionContext containerView];
    CGFloat duration = [self transitionDuration:transitionContext];
    
    CGFloat toTransition = CGRectGetWidth(containView.bounds);
    CGFloat fromTranstion = toTransition * 0.3;
    //Add subview
    [containView addSubview:toView];
    BOOL navHidden = self.nav.navigationBar.isHidden;
    UIColor * fromColor = fromvc.lh_barTintColor;
    UIColor * toColor = tovc.lh_barTintColor;
    if (self.operation == LHNavAnimatorOperationPush) {
        self.nav.view.userInteractionEnabled = NO;
        toView.transform = CGAffineTransformMakeTranslation(toTransition, 0);
        fromView.transform = CGAffineTransformIdentity;
        [containView bringSubviewToFront:toView];
        self.nav.navigationBar.barTintColor = fromColor;
        [UIView animateWithDuration:duration
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toView.transform = CGAffineTransformIdentity;
                             fromView.transform = CGAffineTransformMakeTranslation(-1 * fromTranstion, 0);
                             if (!navHidden && toColor != nil) {
                                 self.nav.navigationBar.barTintColor = toColor;
                             }
                         } completion:^(BOOL finished) {
                             self.nav.view.userInteractionEnabled = YES;
                             fromView.transform = CGAffineTransformIdentity;
                             toView.transform = CGAffineTransformIdentity;
                             BOOL canceled = [transitionContext transitionWasCancelled];
                             [transitionContext completeTransition:!canceled];
                         }];
    }else{
        [containView bringSubviewToFront:fromView];
        toView.transform = CGAffineTransformMakeTranslation(-1 * fromTranstion, 0);
        fromView.transform = CGAffineTransformIdentity;
        self.nav.view.userInteractionEnabled = NO;
        self.nav.navigationBar.barTintColor = fromColor;
        [UIView animateWithDuration:duration
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             if (!navHidden && toColor != nil) {
                                 self.nav.navigationBar.barTintColor = toColor;
                             }
                             toView.transform = CGAffineTransformIdentity;
                             fromView.transform = CGAffineTransformMakeTranslation(toTransition, 0);
                         } completion:^(BOOL finished) {
                             self.nav.view.userInteractionEnabled = YES;
                             fromView.transform = CGAffineTransformIdentity;
                             toView.transform = CGAffineTransformIdentity;
                             BOOL canceled = [transitionContext transitionWasCancelled];
                             [transitionContext completeTransition:!canceled];
                         }];
    }
    
}
@end
