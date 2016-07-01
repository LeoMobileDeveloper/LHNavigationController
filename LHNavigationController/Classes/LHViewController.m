//
//  LHViewController.m
//  Pods
//
//  Created by huangwenchen on 16/6/26.
//
//

#import "LHViewController.h"
#define LH_NAV_BAR_HEIGHT 44
@interface LHViewController ()

@property (strong,nonatomic,readwrite)UINavigationBar * lh_navigationBar;

@property (strong,nonatomic,readwrite)UINavigationItem * lh_navigationItem;

@property (strong,nonatomic,readwrite)UIView * lh_view;

@end
@implementation LHViewController

#pragma mark - Property
- (UIView *)lh_view{
    if (_lh_view == nil) {
        _lh_view = [[UIView alloc] init];
    }
    return _lh_view;
}
- (UINavigationBar *)lh_navigationBar{
    if (_lh_navigationBar == nil) {
        _lh_navigationBar = [[UINavigationBar alloc] init];
    }
    return _lh_navigationBar;
}
- (UINavigationItem *)lh_navigationItem{
    if (_lh_navigationItem == nil) {
        _lh_navigationItem = [[UINavigationItem alloc] init];
    }
    return _lh_navigationItem;
}
#pragma mark - Left Circle

- (void)viewDidLoad{
    [super viewDidLoad];
    self.lh_navigationBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.lh_navigationBar.items = @[self.lh_navigationItem];
    [self.view addSubview:_lh_navigationBar];
    
    self.lh_view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_lh_view];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_lh_navigationBar]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_lh_navigationBar)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lh_navigationBar
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topLayoutGuide
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lh_navigationBar
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:LH_NAV_BAR_HEIGHT]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_lh_view]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_lh_view)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_lh_navigationBar]-0-[_lh_view]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_lh_view,_lh_navigationBar)]];
    [self.view bringSubviewToFront:self.lh_navigationBar];
    self.view.backgroundColor = [UIColor whiteColor];
    self.lh_navigationBar.translucent = NO;
}
- (LHNavigationController *)lh_navigationController{
    UINavigationController * nav = self.navigationController;
    if ([nav isKindOfClass:[LHNavigationController class]]) {
        return (LHNavigationController *)nav;
    }
    return nil;
}
@end
