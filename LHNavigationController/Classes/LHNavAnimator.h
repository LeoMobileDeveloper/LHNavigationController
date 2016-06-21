//
//  LHNavAnimator.h
//  LHNavigation
//
//  Created by huangwenchen on 16/6/20.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LHNavAnimatorOperation){
    LHNavAnimatorOperationPush,
    LHNavAnimatorOperationPop,
};
@interface LHNavAnimator : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithDirection:(LHNavAnimatorOperation)direction navigation:(UINavigationController *)nav;

@property (assign,nonatomic)LHNavAnimatorOperation operation;

@property (weak,nonatomic)UINavigationController * nav;

@end
