//
//  Pull2RefreshView.m
//  xcp
//
//  Created by zhengkanyan on 16/4/15.
//  Copyright © 2016年 suchbalance. All rights reserved.
//

#import "Pull2RefreshView.h"

@implementation Pull2RefreshView {
    UILabel     *hintLabel;
}

@synthesize state;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        hintLabel = [[UILabel alloc] init];
        hintLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
        //        hintLabel.autoresizingMask = UIViewAutoresizingNone;
        hintLabel.textColor = [UIColor lightGrayColor];
        hintLabel.font = [UIFont boldSystemFontOfSize:13.0f];
        hintLabel.backgroundColor = [UIColor clearColor];
        hintLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:hintLabel];
        
        hintLabel.frame = CGRectMake(0, frame.size.height - 5.0f, frame.size.width, 5.0f);
    }
    // 初始状态
    [self setState:kDragToRefresh];
    return self;
}

//- (void)setState:(RefreshState)newState {
//    state = newState;
//    NSString *str;
//    switch (newState) {
//        case kDragToRefresh:
//            // 返回初始状态
//            str = [NSString stringWithFormat:@"%@", @"下拉可以刷新"];
//            hintLabel.text = str;
//            break;
//        case kLooseToRefresh:
//            // 返回初始状态
//            str = [NSString stringWithFormat:@"%@", @"松开立即更新"];
//            hintLabel.text = str;
//            break;
//        case kRefreshing:
//            // 返回初始状态
//            str = [NSString stringWithFormat:@"%@", @"加载中"];
//            hintLabel.text = str;
//            break;
//
//        default:
//            break;
//    }
////    [hintLabel sizeToFit];
//}

- (void)setState:(RefreshState)newState {
    state = newState;
    //    NSString *str;
    switch (newState) {
        case kDragToRefresh:
            // 返回初始状态
            //            str = [NSString stringWithFormat:@"%@", ];
            hintLabel.text = @"下拉可以刷新";
            break;
        case kLooseToRefresh:
            // 返回初始状态
            //            str = [NSString stringWithFormat:@"%@", ];
            hintLabel.text = @"松开立即更新";
            break;
        case kRefreshing:
            // 返回初始状态
            //            str = [NSString stringWithFormat:@"%@", ];
            hintLabel.text = @"加载中请等待";
            break;
            
        default:
            break;
    }
        [hintLabel sizeToFit];
}

@end
