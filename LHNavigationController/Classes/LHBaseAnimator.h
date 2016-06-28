//
//  LHBaseAnimator.h
//  Pods
//
//  Created by huangwenchen on 16/6/28.
//
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,LHNavAnimatorOperation){
    LHNavAnimatorOperationPush,
    LHNavAnimatorOperationPop,
};
typedef NS_ENUM(NSInteger,LHNavigationTransitionStyle){
    LHNavigationTransitionStyleDefault,
    LHNavigationTransitionStyle3D,
};
@interface LHBaseAnimator : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithDirection:(LHNavAnimatorOperation)direction navigation:(UINavigationController *)nav;

@property (assign,nonatomic)LHNavAnimatorOperation operation;

@property (weak,nonatomic)UINavigationController * nav;

+ (instancetype)animatorWithStyle:(LHNavigationTransitionStyle)style direction:(LHNavAnimatorOperation)direction navigation:(UINavigationController *)nav;
@end
