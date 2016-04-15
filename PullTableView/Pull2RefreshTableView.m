//
//  Pull2RefreshTableView.m
//  PullTableView
//
//  Created by zhengkanyan on 16/4/15.
//  Copyright © 2016年 zhengkanyan. All rights reserved.
//

#import "Pull2RefreshTableView.h"
#import "Pull2RefreshView.h"

#define kHeaderHeight 40.0f

@implementation Pull2RefreshTableView {
    Pull2RefreshView *dragHeaderView;
    BOOL headerRefreshing;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addHeaderView];
        self.delegate = self;
    }
    return self;
}

- (void)addHeaderView {
    if (!dragHeaderView) {
        CGRect frame = CGRectMake(0, -kHeaderHeight, self.bounds.size.width, kHeaderHeight);
        dragHeaderView = [[Pull2RefreshView alloc] initWithFrame:frame];
        [self addSubview:dragHeaderView];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //added 2013.11.28 动态修改headerView的位置
    if (headerRefreshing)
    {
//        if (scrollView.contentOffset.y >= -scrollView.contentInset.top
//            && scrollView.contentOffset.y < 0)
//        {
//            //注意:修改scrollView.contentInset时，若使当前界面显示位置发生变化，会触发scrollViewDidScroll:，从而导致死循环。
//            //因此此处scrollView.contentInset.top必须为-scrollView.contentOffset.y
//            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//        }
//        else if (scrollView.contentOffset.y == 0)//到0说明headerView已经在tableView最上方，不需要再修改了
//        {
//            scrollView.contentInset = UIEdgeInsetsZero;
//        }
        return;
    }
    
    if (dragHeaderView) {
        if ((dragHeaderView.state == kDragToRefresh || dragHeaderView.state == kRefreshing) && scrollView.contentOffset.y < -kHeaderHeight - 10.f && !headerRefreshing) {
//            NSLog(@"hint text before loose: %@", dragHeaderView.hintLabel.text);
            [dragHeaderView setState:kLooseToRefresh];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (dragHeaderView) {
        if (dragHeaderView.state == kLooseToRefresh && scrollView.contentOffset.y < -kHeaderHeight - 10.0f && !headerRefreshing) {
            headerRefreshing = YES;
            // Keep showing dragHeaderView
            [dragHeaderView setState:kRefreshing];
            [dragHeaderView setNeedsDisplay];
            [self setNeedsDisplay];
//            NSLog(@"hint text after loose: %@", dragHeaderView.hintLabel.text);
//            self.contentInset = UIEdgeInsetsMake(kHeaderHeight, 0, 0, 0);
        }
    }
    
    if (headerRefreshing) {
        [self completeDragRefresh];
        //        headerRefreshing = NO;
    }
}

#pragma mark - Other
- (void)completeDragRefresh {
    sleep(1);
//    [NSThread sleepForTimeInterval:1.0];
//    self.contentInset = UIEdgeInsetsZero;
    [dragHeaderView setState:kDragToRefresh];
    headerRefreshing = NO;
}

@end
