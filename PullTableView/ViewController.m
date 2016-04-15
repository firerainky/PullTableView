//
//  ViewController.m
//  PullTableView
//
//  Created by zhengkanyan on 16/4/15.
//  Copyright © 2016年 zhengkanyan. All rights reserved.
//

#import "ViewController.h"
#import "Pull2RefreshTableView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    Pull2RefreshTableView *tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[Pull2RefreshTableView alloc] initWithFrame:self.view.bounds];
    
//    __weak ViewController *vc = self;
    
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    return cell;
}

@end
