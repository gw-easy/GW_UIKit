//
//  GWCollectionView.h
//  Zhuntiku（准题库）
//
//  Created by zdwx on 2019/12/5.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GWCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>

//刷新layout
- (void)reloadLayout:(UICollectionViewLayout *)layout;

@end

NS_ASSUME_NONNULL_END
