//
//  MainViewController.m
//  Yueyue
//
//  Created by Weenie Wang on 2018/1/23.
//  Copyright © 2018年 guilin. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h"
#import "MainCollectionCell.h"
#import "UIView+Frame.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIButton *leftBtn;

@property (nonatomic,strong) UIButton *rightBtn;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,strong) NSMutableDictionary *dic;

@end

@implementation MainViewController

#pragma mark - lazyLoading

- (NSMutableDictionary *)dic{
    
    if (!_dic) {
        _dic = [NSMutableDictionary dictionary];
    }
    return _dic;
}

- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor orangeColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[MainCollectionCell class] forCellWithReuseIdentifier:@"MainCollectionCell"];
        
    }
    
    return _collectionView;
}


- (UIButton *)leftBtn{
    
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(0, 0, 60, 200);
        [_leftBtn setImage:[UIImage imageNamed:@"btn_left"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftBtn;
}

- (UIButton *)rightBtn{
    
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(self.view.frame.size.width-60, 0, 60, 200);
        [_rightBtn setImage:[UIImage imageNamed:@"btn_right"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _rightBtn;
    
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 0;
    self.dataArr = @[@"a",@"b",@"c",@"d",@"e",@"f"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Main";
    [self creatTableView];
    
}


#pragma mark - CreatUI

- (void)creatTableView{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor lightGrayColor];
    tableView.tableFooterView = [[UIView alloc] init];
    [tableView registerClass:[MainCell class] forCellReuseIdentifier:NSStringFromClass([MainCell class])];
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - ActionOnClick

- (void)leftBtnClick{
    NSLog(@"%s",__func__);
    
    
    if (self.index == 0) {
        
        NSLog(@"00000000000000了");
        
        return;
    }else{
        
        --self.index;
        
        // 滚动
        CGPoint offset = self.collectionView.contentOffset;
        offset.x = self.index * self.view.frame.size.width;
        [_collectionView setContentOffset:offset animated:YES];
        [_collectionView reloadData];
        
    }
    
    
    
}

- (void)rightBtnClick{
    
    if (self.index == 5) {
        
        NSLog(@"666666666666666了");
        
        return;
        
    }else{
        
        ++self.index;
        
        // 滚动
        CGPoint offset = self.collectionView.contentOffset;
        offset.x = self.index * self.view.frame.size.width;
        [_collectionView setContentOffset:offset animated:YES];
        [_collectionView reloadData];
    }
    
    
    self.collectionView.height = 100;
    
    
  
    [self.tableView reloadData];
    
    
}


- (void)moreBtnClick{
    
    if ([[self.dic objectForKey:@"isShow"] isEqualToString:@"yes"]) {
        [self.dic setObject:@"no" forKey:@"isShow"];
    }else{
        
        [self.dic setObject:@"yes" forKey:@"isShow"];
    }
    
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

    
    
}

#pragma mark - TableView Delegate Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 60;
        
    }else if (indexPath.section == 1) {
        
        return 100;
        
    }else{
        
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
//
//        MainCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//
        
        return self.collectionView.frame.size.height;
        
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 10;
        
    }else if(section == 1){
        
        return 30;
        
    }else{
        return 30;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return CGFLOAT_MIN;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 1) {
        
        if ([[self.dic objectForKey:@"isShow"] isEqualToString:@"yes"]) {
            
            return 1;
        }else{
            
            return 0;
        }
        
    }else{
        
        return 1;
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2) {
        
        MainCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainCell class])];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        [cell.contentView addSubview:self.collectionView];
        
        [cell.contentView addSubview:self.leftBtn];
        [cell.contentView addSubview:self.rightBtn];
        
        return cell;
        
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
        
        if (!cell ) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
        }
        return cell;
    }
    
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
        
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setTitle:@"隐藏听力原文" forState:UIControlStateNormal];
        [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        moreBtn.frame = CGRectMake(20, 0, 200, 30);
        [moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [moreBtn sizeToFit];
        [bgView addSubview:moreBtn];
        
        return bgView;
        
    }else if (section == 2){
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.text = @"第一题/共五题";
        label.frame = CGRectMake(20, 0, 200, 30);
        [bgView addSubview:label];
        
        return bgView;
        
    }else{
        
        return nil;
    }
    
}

#pragma mark - CollectionView Delegate Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MainCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = randomColor;
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 200);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第 %zd组 第%zd个",indexPath.section, indexPath.row);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSLog(@"%f",scrollView.contentOffset.x);
    
    self.index = scrollView.contentOffset.x/self.view.width;
}



@end
