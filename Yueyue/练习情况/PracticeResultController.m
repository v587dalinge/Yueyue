//
//  PracticeResultController.m
//  Yueyue
//
//  Created by Weenie Wang on 2018/1/24.
//  Copyright © 2018年 guilin. All rights reserved.
//

#import "PracticeResultController.h"
#import "PractiseTopCell.h"
#import "PractiseMidCell.h"
#import "PractiseDetailBtnCell.h"

@interface PracticeResultController ()<UITableViewDelegate,UITableViewDataSource>

/** <#descrip#> */
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation PracticeResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"练习情况";
    
    [self creatTableView];
}

- (void)creatTableView{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [tableView registerClass:[PractiseTopCell class] forCellReuseIdentifier:NSStringFromClass([PractiseTopCell class])];
    [tableView registerClass:[PractiseMidCell class] forCellReuseIdentifier:NSStringFromClass([PractiseMidCell class])];
    [tableView registerClass:[PractiseDetailBtnCell class] forCellReuseIdentifier:NSStringFromClass([PractiseDetailBtnCell class])];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
        
    }else{
        
        return 60;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        PractiseTopCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PractiseTopCell class])];
        
        return cell;
        
    }else if (indexPath.row == 3){
        
        PractiseDetailBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PractiseDetailBtnCell class])];
        
        return cell;
        
        
        
    } else{
        
        PractiseMidCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PractiseMidCell class])];
        return cell;
    }
    
    
}

@end
