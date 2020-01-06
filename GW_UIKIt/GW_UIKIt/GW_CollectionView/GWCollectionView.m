//
//  GWCollectionView.m
//  Zhuntiku（准题库）
//
//  Created by zdwx on 2019/12/5.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "GWCollectionView.h"

@interface GWCollectionView()

@end

@implementation GWCollectionView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setConfig];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame collectionViewLayout:[UICollectionViewLayout new]]) {
        [self setConfig];
    }
    return self;
}

#pragma mark - UI
- (void)setConfig{
    self.delegate = self;
    self.dataSource = self;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

- (void)reloadLayout:(UICollectionViewLayout *)layout{
    if (self.collectionViewLayout) {
        [self.collectionViewLayout invalidateLayout];
    }
    if (layout) {
        self.collectionViewLayout = layout;
        [self reloadData];
    }
}

#pragma mark - collectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout

//minimumLineSpacing指的是同一个section 内部 item 和滚动方向垂直方向的最小间距； 如果实际间距比较大则不生效
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.f;
}

//minimumInteritemSpacing指的是同一个section 内部 item 的滚动方向的最小间距； 如果实际间距比较大则不生效
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.f;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeZero;
}

//设置section的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

//footer的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}



@end
