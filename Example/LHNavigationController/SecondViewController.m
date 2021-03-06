//
//  SecondViewController.m
//  LHNavigationController
//
//  Created by huangwenchen on 16/6/26.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "SecondViewController.h"
#import "ThridViewController.h"
#import <LHNavigationController/LHNavigation.h>

@implementation SecondViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.lh_navigationItem.title = @"Pan right";
    self.lh_barTintColor = [UIColor orangeColor];
    self.lh_barTitlesTintColor = [UIColor whiteColor];
    self.lh_barItemsTintColor = [UIColor whiteColor];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backIcon"]
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(back)];;
    self.lh_navigationItem.leftBarButtonItem = leftItem;
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index:%ld",(long)indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ThridViewController * tvc = [[ThridViewController alloc] init];
    [self.navigationController pushViewController:tvc animated:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
