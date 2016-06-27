//
//  LHCollectionViewController.h
//  Pods
//
//  Created by huangwenchen on 16/6/27.
//
//

#import <LHViewController.h>

@interface LHCollectionViewController : LHViewController<UICollectionViewDelegate,UICollectionViewDataSource>

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

@property(nonatomic, strong) UICollectionView * collectionView;

@property(nonatomic, readonly) UICollectionViewLayout *collectionViewLayout;

@end
