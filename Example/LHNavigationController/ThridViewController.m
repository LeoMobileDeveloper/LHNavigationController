//
//  ThridViewController.m
//  LHNavigationController
//
//  Created by huangwenchen on 16/6/28.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "ThridViewController.h"
#import <LHNavigationController/LHNavigation.h>
@implementation ThridViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    UICollectionViewFlowLayout * flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(50, 50);
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.lh_barTintColor = [UIColor orangeColor];
    self.lh_barItemsTintColor = [UIColor whiteColor];
    self.lh_barTitlesTintColor = [UIColor whiteColor];
    self.lh_navigationItem.title = @"ColelctionView";
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backIcon"]
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(back)];;
    self.lh_navigationItem.leftBarButtonItem = leftItem;
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
