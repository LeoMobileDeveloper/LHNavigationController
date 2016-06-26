//
//  LHTableViewController.h
//  Pods
//
//  Created by huangwenchen on 16/6/26.
//
//

#import <UIKit/UIKit.h>
#import "LHViewController.h"
@interface LHTableViewController : LHViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)UITableView * tableView;

- (instancetype)initWithStyle:(UITableViewStyle)style;
@end
