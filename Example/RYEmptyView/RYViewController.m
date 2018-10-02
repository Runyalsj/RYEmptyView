//
//  RYViewController.m
//  RYEmptyView
//
//  Created by Runyalsj on 10/02/2018.
//  Copyright (c) 2018 Runyalsj. All rights reserved.
//

#import "RYViewController.h"
#import "RYEmptyView.h"
#import "UIView+RYKit.h"
#import "Masonry.h"
#import "RYTableViewController.h"
#import "RYCollectionViewController.h"

@interface RYViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation RYViewController
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray =[NSMutableArray array];
    }
    return _dataArray;
}


#pragma mark-- tableview
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //一、一句话添加展位图
    self.tableView.emptyView = [RYEmptyView createEmptyViewWithType:RYEmptyTypeNotNetwork resetBlock:^{
        //三、手动关闭
        [self.tableView ry_hideEmptyView];
        
        
        self.dataArray = [NSMutableArray arrayWithObjects:@"手动显示",@"自动显示（Tableview）",@"自动显隐（Collection）",nil];
        [self.tableView reloadData];
    }];
    
    
    //二、手动显示
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView ry_showEmptyView];
    });
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self cellDidAtIndexPath:indexPath];
}

- (void)cellDidAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:{
            [self.tableView ry_showEmptyView];
        }
            break;
        case 1:
            vc = [[RYTableViewController alloc] init];
            break;
        case 2:
            vc = [[RYCollectionViewController alloc] init];
            break;
    }
    if(vc){
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


@end
