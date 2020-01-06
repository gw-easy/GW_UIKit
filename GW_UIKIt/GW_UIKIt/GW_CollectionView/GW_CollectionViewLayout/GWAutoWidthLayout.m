//
//  GWAutoWidthLayout.m
//  Zhuntiku（准题库）
//
//  Created by zdwx on 2019/12/17.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "GWAutoWidthLayout.h"

@interface GWAutoWidthLayout()
//属性
@property (nonatomic,strong) NSMutableArray * attributesArr;
//item 宽度数组
@property (nonatomic,strong) NSMutableArray * itemWidthArr;
//页数
@property (assign, nonatomic) NSInteger page;
//列数
@property (nonatomic,assign) NSInteger columnNum;

@property (nonatomic,assign) CGFloat  itemX;
@property (nonatomic,assign) CGFloat  itemY;
@property (nonatomic,assign) CGFloat  itemW;
@end

@implementation GWAutoWidthLayout

- (void)prepareLayout{
    [super prepareLayout];
    [self.attributesArr removeAllObjects];
    self.columnNum = 1;
    self.page = 0;
    self.itemX = 0;
    NSInteger cou = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0 ; i< cou; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributesArr addObject:attr];
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributesArr;
}

//计算item位置
- (UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes * attributes = [ UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat W = self.itemWidth;
    if (_getItemWidth) {
        W = _getItemWidth(indexPath);
    }
    if ((self.itemX+W)>self.collectionView.frame.size.width-self.itemLRSpace +self.page*(self.collectionView.frame.size.width)) {
        self.columnNum++;
        if (self.maxColumnNum < self.columnNum) {
            self.page++;
            self.columnNum = 1;
        }
        self.itemX =  self.page*(self.collectionView.frame.size.width);
    }
    CGFloat x =self.itemX+self.itemLRSpace;
    self.itemY = (self.columnNum-1) * (self.itemHeight +self.itemHVSpace);
    attributes.frame =CGRectMake(x, self.itemY, W, self.itemHeight);
    self.itemX = CGRectGetMaxX(attributes.frame);
    return attributes;
}
//设置内容size
- (CGSize)collectionViewContentSize{
    return CGSizeMake((self.page+1)*self.collectionView.frame.size.width,self.itemY+self.itemHeight);
}

#pragma mark == Getter
- (NSMutableArray *)attributesArr{
    if (_attributesArr == nil) {
        _attributesArr = [NSMutableArray array];
    }
    return _attributesArr;
}
- (NSMutableArray *)itemWidthArr{
    if (_itemWidthArr == nil) {
        _itemWidthArr = [NSMutableArray array];
    }
    return _itemWidthArr;
}
- (CGFloat)itemHeight{
    if (_itemHeight == 0) {
        return 25.0f;
    }
    return _itemHeight;
}
- (CGFloat)itemHVSpace{
    if (_itemLRSpace == 0) {
        return 10.0f;
    }
    return _itemLRSpace;
}
- (CGFloat)itemLRSpace{
    if (_itemHVSpace == 0) {
        return 10.0f;
    }
    return _itemHVSpace;
}

- (NSInteger)maxColumnNum{
    if (_maxColumnNum == 0) {
        return 10000000;
    }
    return _maxColumnNum;
}
@end
