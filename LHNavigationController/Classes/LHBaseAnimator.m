//
//  LHBaseAnimator.m
//  Pods
//
//  Created by huangwenchen on 16/6/28.
//
//

#import "LHBaseAnimator.h"
#import "LHDefaultAnimator.h"
#import "LH3DAnimator.h"

@implementation LHBaseAnimator

- (instancetype)initWithDirection:(LHNavAnimatorOperation)operation navigation:(UINavigationController *)nav{
    if (self = [super init]) {
        self.operation = operation;
        _nav = nav;
    }
    return self;
}
+ (instancetype)animatorWithStyle:(LHNavigationTransitionStyle)style direction:(LHNavAnimatorOperation)direction navigation:(UINavigationController *)nav{
    if (style == LHNavigationTransitionStyleDefault) {
        return [[LHDefaultAnimator alloc] initWithDirection:direction navigation:nav];
    }else{
        return [[LH3DAnimator alloc] initWithDirection:direction navigation:nav];
    }
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    [NSException raise:@"LHAnimatorException" format:@"Sub class must override this method at %@ %d",__FILE__,__LINE__];
    return 0.0;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    [NSException raise:@"LHAnimatorException" format:@"Sub class must override this method at %@ %d",__FILE__,__LINE__];
}
@end
