//
//  LHViewController.h
//  Pods
//
//  Created by huangwenchen on 16/6/26.
//
//

#import <UIKit/UIKit.h>
#import "LHNavigationController.h"

@interface LHViewController : UIViewController

/**
 *  Private navigaitonBar that is added to self.view
 */
@property (strong,nonatomic,readonly)UINavigationBar * lh_navigationBar;

@property (strong,nonatomic,readonly)UINavigationItem * lh_navigationItem;

@property (strong,nonatomic,readonly)UIView * lh_view;

@property (strong,nonatomic,readonly)LHNavigationController * lh_navigationController;

@property (strong,nonatomic)UIColor * barTintColor;

@property (strong,nonatomic)UIColor * barItemsTintColor;

@property (strong,nonatomic)UIColor * barTitlesTintColor;

@end
