//
//  Pull2RefreshView.h
//  xcp
//
//  Created by zhengkanyan on 16/4/15.
//  Copyright © 2016年 suchbalance. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kDragToRefresh,
    kLooseToRefresh,
    kRefreshing
} RefreshState;

@interface Pull2RefreshView : UIView

@property (nonatomic, assign) RefreshState state;

@end
