//
//  UIViewController+LHNavigation.m
//  Pods
//
//  Created by huangwenchen on 16/7/1.
//
//

#import "UIViewController+LHNavigation.h"
#import <objc/runtime.h>
#import "LHViewController.h"

@implementation UIViewController (LHNavigation)

- (void)setLh_barTintColor:(UIColor *)lh_barTintColor{
    objc_setAssociatedObject(self, @selector(lh_barTintColor),lh_barTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self isKindOfClass:[LHViewController class]]) {
        LHViewController * vc = (LHViewController *)self;
        vc.view.backgroundColor = lh_barTintColor;
        vc.lh_navigationBar.barTintColor = lh_barTintColor;
    }else{
        self.navigationController.navigationBar.barTintColor = lh_barTintColor;
    }
}
- (UIColor *)lh_barTintColor{
    objc_getAssociatedObject(self, _cmd);
}
- (void)setLh_barItemsTintColor:(UIColor *)lh_barItemsTintColor{
    objc_setAssociatedObject(self, @selector(lh_barItemsTintColor),lh_barItemsTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self isKindOfClass:[LHViewController class]]) {
        LHViewController * vc = (LHViewController *)self;
        vc.lh_navigationBar.tintColor = lh_barItemsTintColor;
    }else{
        self.navigationController.navigationBar.tintColor = lh_barItemsTintColor;
    }
}
- (UIColor *)lh_barItemsTintColor{
    objc_getAssociatedObject(self, _cmd);
}
- (void)setLh_barTitlesTintColor:(UIColor *)lh_barTitlesTintColor{
    objc_setAssociatedObject(self, @selector(lh_barTitlesTintColor),lh_barTitlesTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self isKindOfClass:[LHViewController class]]) {
        LHViewController * vc = (LHViewController *)self;
        NSMutableDictionary * titleAttributs = [vc.lh_navigationBar.titleTextAttributes mutableCopy];
        if (titleAttributs == nil) {
            titleAttributs = [NSMutableDictionary new];
        }
        [titleAttributs setObject:lh_barTitlesTintColor forKey:NSForegroundColorAttributeName];
        vc.lh_navigationBar.titleTextAttributes = titleAttributs;
    }else{
        NSMutableDictionary * titleAttributs = [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
        if (titleAttributs == nil) {
            titleAttributs = [NSMutableDictionary new];
        }
        [titleAttributs setObject:lh_barTitlesTintColor forKey:NSForegroundColorAttributeName];
        self.navigationController.navigationBar.titleTextAttributes = titleAttributs;
    }
}
- (UIColor *)lh_barTitlesTintColor{
    objc_getAssociatedObject(self, _cmd);
}
@end
