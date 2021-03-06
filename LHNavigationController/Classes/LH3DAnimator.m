//
//  LH3DAnimator.m
//  Pods
//
//  Created by huangwenchen on 16/6/27.
//
//

#import "LH3DAnimator.h"
#import "UIViewController+LHNavigation.h"

@implementation LH3DAnimator

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
    //Add subview
    [containView addSubview:toView];
    UIView * overLayView = [[UIView alloc] initWithFrame:containView.bounds];
    overLayView.backgroundColor = [UIColor blackColor];
    BOOL navHidden = self.nav.navigationBar.isHidden;
    UIColor * fromColor = fromvc.lh_barTintColor;
    UIColor * toColor = tovc.lh_barTintColor;
    
    if (self.operation == LHNavAnimatorOperationPush) {
        self.nav.view.userInteractionEnabled = NO;
        toView.transform = CGAffineTransformMakeTranslation(toTransition, 0);
        fromView.transform = CGAffineTransformIdentity;
        [fromView addSubview:overLayView];
        overLayView.alpha = 0.0;
        [containView bringSubviewToFront:toView];
        self.nav.navigationBar.barTintColor = fromColor;

        [UIView animateWithDuration:duration
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toView.transform = CGAffineTransformIdentity;
                             fromView.transform = CGAffineTransformMakeScale(0.95, 0.95);
                             overLayView.alpha = 0.5;
                             if (!navHidden && toColor != nil) {
                                 self.nav.navigationBar.barTintColor = toColor;
                             }
                         } completion:^(BOOL finished) {
                             self.nav.view.userInteractionEnabled = YES;
                             fromView.transform = CGAffineTransformIdentity;
                             toView.transform = CGAffineTransformIdentity;
                             [overLayView removeFromSuperview];
                             BOOL canceled = [transitionContext transitionWasCancelled];
                             [transitionContext completeTransition:!canceled];
                         }];
    }else{
        [containView bringSubviewToFront:fromView];
        toView.transform = CGAffineTransformMakeScale(0.95, 0.95);
        fromView.transform = CGAffineTransformIdentity;
        self.nav.view.userInteractionEnabled = NO;
        [toView addSubview:overLayView];
        overLayView.alpha = 0.5;
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
                             overLayView.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             self.nav.view.userInteractionEnabled = YES;
                             fromView.transform = CGAffineTransformIdentity;
                             toView.transform = CGAffineTransformIdentity;
                             [overLayView removeFromSuperview];
                             BOOL canceled = [transitionContext transitionWasCancelled];
                             [transitionContext completeTransition:!canceled];
                         }];
    }
    
}

@end
