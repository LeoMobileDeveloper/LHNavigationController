//
//  LHCollectionViewController.m
//  Pods
//
//  Created by huangwenchen on 16/6/27.
//
//

#import "LHCollectionViewController.h"

@implementation LHCollectionViewController

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_collectionViewLayout];
    }
    return _collectionView;
}
- (instancetype)init{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:flowLayout];
}
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super init]) {
        _collectionViewLayout = layout;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.lh_view addSubview:self.collectionView];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    [NSException raise:@"LHCollectionViewController exception" format:@"Subclass should override this method at %s %d",__FILE__,__LINE__];
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    [NSException raise:@"LHCollectionViewController exception" format:@"Subclass should override this method at %s %d",__FILE__,__LINE__];
    return nil;
}
@end
