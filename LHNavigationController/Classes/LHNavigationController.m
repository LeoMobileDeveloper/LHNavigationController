//
//  LHNavigationController.m
//  LHNavigation
//
//  Created by huangwenchen on 16/6/20.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "LHNavigationController.h"
#import "LHDefaultAnimator.h"

@interface LHNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (assign,nonatomic)BOOL isInteractive;

@property (strong,nonatomic)UIPercentDrivenInteractiveTransition * transition;

@property (strong,nonatomic)UIPanGestureRecognizer * pushPan;

@property (strong,nonatomic)UIPanGestureRecognizer * popPan;

@end
@implementation LHNavigationController

-(UIPercentDrivenInteractiveTransition *)transition{
    if (_transition == nil) {
        _transition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return _transition;
}
- (instancetype)init{
    if (self = [super init]) {
        _transition = LHNavigationTransitionStyleDefault;
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _transition = LHNavigationTransitionStyleDefault;
    }
    return self;
}
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self = [super initWithRootViewController:rootViewController]) {
        _transition = LHNavigationTransitionStyleDefault;
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _transition = LHNavigationTransitionStyleDefault;
    }
    return self;
}
#pragma mark - Life circle
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
    _isInteractive = NO;
    self.pushPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePush:)];
    self.pushPan.delegate = self;
    self.pushPan.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.pushPan];
    
    self.popPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePop:)];
    self.popPan.delegate = self;
    self.popPan.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.popPan];
    self.delegate = self;
}

#pragma mark - Gesture
- (void)handlePush:(UIScreenEdgePanGestureRecognizer *)sender{
    CGFloat tx = [sender translationInView:self.view].x;
    CGFloat pec = fabs(tx/CGRectGetWidth(self.view.frame));
    CGFloat vx = [sender velocityInView:self.view].x;
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.isInteractive = YES;
        UIViewController * nextvc = [self.lhDelegate viewControllerAfterController:self.viewControllers.lastObject];
        [self pushViewController:nextvc animated:YES];
    }else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.transition updateInteractiveTransition:pec];
    }else if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        if (vx > 0) {//
            [self.transition cancelInteractiveTransition];
        }else{
            [self.transition finishInteractiveTransition];
        }
        self.isInteractive = NO;
    }
}

- (void)handlePop:(UIScreenEdgePanGestureRecognizer *)sender{
    CGFloat tx = [sender translationInView:self.view].x;
    CGFloat pec = fabs(tx/CGRectGetWidth(self.view.frame));
    CGFloat vx = [sender velocityInView:self.view].x;
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.isInteractive = YES;
        [self popViewControllerAnimated:YES];
    }else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.transition updateInteractiveTransition:pec];
    }else if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        if (vx < 0) {//
            [self.transition cancelInteractiveTransition];
        }else{
            [self.transition finishInteractiveTransition];
        }
        self.isInteractive = NO;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    if (panGestureRecognizer == self.pushPan) {
        UIViewController * topMost = self.viewControllers.lastObject;
        if ([self.lhDelegate respondsToSelector:@selector(viewControllerAfterController:)]) {
            UIViewController * nvc = [self.lhDelegate viewControllerAfterController:topMost];
            return nvc != nil  && velocity.x < 0;
        }
        return NO;
    }else{
        return velocity.x > 0 && self.viewControllers.count > 1;
    }
}
#pragma mark - Transition
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC{
    LHNavAnimatorOperation direaction;
    
    if (operation == UINavigationControllerOperationPush) {
        direaction = LHNavAnimatorOperationPush;
    }
    if (operation == UINavigationControllerOperationPop) {
        direaction = LHNavAnimatorOperationPop;
    }
    return [LHBaseAnimator animatorWithStyle:_lh_transtionStyle direction:direaction navigation:self];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return _isInteractive ? self.transition : nil;
}
@end
