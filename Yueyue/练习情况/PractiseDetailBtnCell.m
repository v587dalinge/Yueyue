//
//  PractiseDetailBtnCell.m
//  Yueyue
//
//  Created by Weenie Wang on 2018/1/24.
//  Copyright © 2018年 guilin. All rights reserved.
//

#import "PractiseDetailBtnCell.h"
#import <Masonry.h>

@interface PractiseDetailBtnCell()

/** 背景 */
@property (nonatomic,weak) UIView *bgView;
/** <#descrip#> */
@property (nonatomic,weak) UIButton *detailBtn;

@end

@implementation PractiseDetailBtnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatSubViews];
    }
    return self;
}


- (void)creatSubViews{
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor lightGrayColor];
    self.bgView = bgView;
    [self.contentView addSubview:bgView];
    
    UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    detailBtn.backgroundColor = [UIColor brownColor];
    detailBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [detailBtn setTitle:@"查看详情" forState:UIControlStateNormal];
    detailBtn.layer.cornerRadius = 3.0;
    [detailBtn.layer masksToBounds];
    self.detailBtn = detailBtn;
    [self.bgView addSubview:self.detailBtn];
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.bottom.mas_equalTo(0);
        
    }];
    
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
        make.centerY.mas_equalTo(self.bgView.mas_centerY);
        make.width.mas_offset(200);
        make.height.mas_equalTo(25);
    }];
   
    
    
}

@end
