//
//  ViewController.m
//  LBMasonry
//
//  Created by 杨庆人 on 17/9/8.
//  Copyright © 2017年 杨庆人. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "LBTableViewCell.h"

@interface ViewController ()
@property (nonatomic,strong)UIView *view1;
@property (nonatomic,strong)UIView *view2;
@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController


- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = [UIColor yellowColor];
    }
    return _view1;
}
- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] init];
        _view2.backgroundColor = [UIColor yellowColor];
    }
    return _view2;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = (id<UITableViewDataSource>)self;
        _tableView.delegate = (id<UITableViewDelegate>)self;
        _tableView.estimatedRowHeight = 80;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.view1];
    [self.scrollView addSubview:self.view2];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    // 加上width约束scrollView的contentSize的width，让scrollView在水平方向上能够撑开
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.scrollView);
        make.height.mas_equalTo(500);
        make.width.mas_equalTo(self.view.bounds.size.width);
    }];
    // 加上bottom连接scrollView的底部，加上两个view的高，让scrollView在竖直方向上能够撑开
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view1.mas_bottom).offset(10);
        make.left.right.mas_equalTo(self.scrollView);
        make.height.mas_equalTo(500);
        make.bottom.mas_equalTo(self.scrollView.mas_bottom).offset(-10);
    }];

//    [self.view addSubview:self.tableView];
//    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
//    }];


    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identity = @"LBTableViewCell";
    LBTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        cell = [[LBTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
