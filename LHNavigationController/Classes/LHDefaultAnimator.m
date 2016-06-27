//
//  LHNavAnimator.m
//  LHNavigation
//
//  Created by huangwenchen on 16/6/20.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "LHDefaultAnimator.h"

@implementation LHDefaultAnimator
- (instancetype)initWithDirection:(LHNavAnimatorOperation)operation navigation:(UINavigationController *)nav{
    if (self = [super init]) {
        _operation = operation;
        _nav = nav;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
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
    
    if (_operation == LHNavAnimatorOperationPush) {
        _nav.view.userInteractionEnabled = NO;
        toView.transform = CGAffineTransformMakeTranslation(toTransition, 0);
        fromView.transform = CGAffineTransformIdentity;
        [containView bringSubviewToFront:toView];
        [UIView animateWithDuration:duration
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toView.transform = CGAffineTransformIdentity;
                             fromView.transform = CGAffineTransformMakeTranslation(-1 * fromTranstion, 0);
                         } completion:^(BOOL finished) {
                             _nav.view.userInteractionEnabled = YES;
                             fromView.transform = CGAffineTransformIdentity;
                             toView.transform = CGAffineTransformIdentity;
                             BOOL canceled = [transitionContext transitionWasCancelled];
                             [transitionContext completeTransition:!canceled];
                         }];
    }else{
        [containView bringSubviewToFront:fromView];
        toView.transform = CGAffineTransformMakeTranslation(-1 * fromTranstion, 0);
        fromView.transform = CGAffineTransformIdentity;
        _nav.view.userInteractionEnabled = NO;
        [UIView animateWithDuration:duration
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toView.transform = CGAffineTransformIdentity;
                             fromView.transform = CGAffineTransformMakeTranslation(toTransition, 0);
                         } completion:^(BOOL finished) {
                             _nav.view.userInteractionEnabled = YES;
                             fromView.transform = CGAffineTransformIdentity;
                             toView.transform = CGAffineTransformIdentity;
                             BOOL canceled = [transitionContext transitionWasCancelled];
                             [transitionContext completeTransition:!canceled];
                         }];
    }
    
}
@end
