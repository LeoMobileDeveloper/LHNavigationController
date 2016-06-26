//
//  LHTableViewController.m
//  Pods
//
//  Created by huangwenchen on 16/6/26.
//
//

#import "LHTableViewController.h"

@interface LHTableViewController ()<UIGestureRecognizerDelegate>

@property (assign,nonatomic)UITableViewStyle tableStyle;

@end
@implementation LHTableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super init]) {
        _tableStyle = style;
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:self.lh_view.bounds style:_tableStyle];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.lh_view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [NSException raise:@"LHTableviewController exception" format:@"Subclass should override this method at %d",__LINE__];
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [NSException raise:@"LHTableviewController exception" format:@"Subclass should override this method at %d",__LINE__];
    return nil;
}

@end
