//
//  MainCollectionCell.m
//  Yueyue
//
//  Created by Weenie Wang on 2018/1/23.
//  Copyright © 2018年 guilin. All rights reserved.
//

#import "MainCollectionCell.h"
#import <Masonry.h>

@interface MainCollectionCell()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MainCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatTableView];
    }
    
    return self;
}


- (void)creatTableView{
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    self.tableView = tableView;
    [self.contentView addSubview:self.tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
    
}


- (void)layoutSubviews{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
}

@end
