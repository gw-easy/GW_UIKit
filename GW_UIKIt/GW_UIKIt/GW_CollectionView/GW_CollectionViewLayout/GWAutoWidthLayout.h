//
//  GWAutoWidthLayout.h
//  Zhuntiku（准题库）
//
//  Created by zdwx on 2019/12/17.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

//适应宽度
NS_ASSUME_NONNULL_BEGIN

@interface GWAutoWidthLayout : UICollectionViewLayout
//item 的高度 默认25
@property (assign, nonatomic) CGFloat itemHeight;
//item 的高度 默认0 宽度一致时设置
@property (assign, nonatomic) CGFloat itemWidth;
//item左右的间距 默认10
@property (assign, nonatomic) CGFloat itemLRSpace;
//item上下的间距 默认10
@property (assign, nonatomic) CGFloat itemHVSpace;
//最大行数
@property (assign, nonatomic) NSInteger maxColumnNum;

//需要在外部自动计算高度 - 优先级大于itemWidth
@property (copy, nonatomic) CGFloat(^getItemWidth)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
