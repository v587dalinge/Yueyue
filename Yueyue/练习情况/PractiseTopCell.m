//
//  PractiseTopCell.m
//  Yueyue
//
//  Created by Weenie Wang on 2018/1/24.
//  Copyright © 2018年 guilin. All rights reserved.
//

#import "PractiseTopCell.h"
#import <Masonry.h>

@interface PractiseTopCell()

/** 背景 */
@property (nonatomic,weak) UIView *bgView;
/** 课本名称 */
@property (nonatomic,weak) UILabel *bookNameLabel;
/** 提交时间 */
@property (nonatomic,weak) UILabel *submitTimeLabel;
/** 正确率 */
@property (nonatomic,weak) UILabel *accuracyLabel;
/** 平均正确率 */
@property (nonatomic,weak) UILabel *perAccuracyLabel;

@end


@implementation PractiseTopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_s"]];
        self.contentView.backgroundColor = [UIColor clearColor];
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
    
    
    UILabel *bookNameLabel = [[UILabel alloc] init];
    bookNameLabel.font = [UIFont systemFontOfSize:18];
    bookNameLabel.textColor = [UIColor orangeColor];
    bookNameLabel.textAlignment = NSTextAlignmentCenter;
    bookNameLabel.text = @"人教版 英语三年级上册Unit 1";
    self.bookNameLabel = bookNameLabel;
    [self.bgView addSubview:bookNameLabel];
    
    UILabel *submitTimeLabel = [[UILabel alloc] init];
    submitTimeLabel.font = [UIFont systemFontOfSize:13];
    submitTimeLabel.textColor = [UIColor orangeColor];
    submitTimeLabel.textAlignment = NSTextAlignmentCenter;
    submitTimeLabel.text = @"提交时间 : 11月1日 09:43";
    self.submitTimeLabel = submitTimeLabel;
    [self.bgView addSubview:submitTimeLabel];
    
    UILabel *accuracyLabel = [[UILabel alloc] init];
    accuracyLabel.font = [UIFont systemFontOfSize:18];
    accuracyLabel.textColor = [UIColor orangeColor];
    accuracyLabel.textAlignment = NSTextAlignmentCenter;
    accuracyLabel.text = @"正确率 : 50%";
    self.accuracyLabel = accuracyLabel;
    [self.bgView addSubview:accuracyLabel];
    
    UILabel *perAccuracyLabel = [[UILabel alloc] init];
    perAccuracyLabel.font = [UIFont systemFontOfSize:12];
    perAccuracyLabel.textColor = [UIColor orangeColor];
    perAccuracyLabel.textAlignment = NSTextAlignmentCenter;
    perAccuracyLabel.text = @"全班平均正确率 : 70%";
    self.perAccuracyLabel = perAccuracyLabel;
    [self.bgView addSubview:perAccuracyLabel];
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        make.top.mas_equalTo(8);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        
    }];
    
    
    [self.bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(self.bgView.mas_right).mas_offset(-15);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(20);
        
    }];
    
    [self.submitTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.bookNameLabel.mas_left);
        make.right.mas_equalTo(self.bookNameLabel.mas_right);
        make.top.mas_equalTo(self.bookNameLabel.mas_bottom).mas_offset(8);
        make.height.mas_equalTo(20);
        
    }];
    
    [self.accuracyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.bookNameLabel.mas_left);
        make.right.mas_equalTo(self.bookNameLabel.mas_right);
        make.top.mas_equalTo(self.submitTimeLabel.mas_bottom).mas_offset(30);
        make.height.mas_equalTo(20);
        
    }];
    
    [self.perAccuracyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.bookNameLabel.mas_left);
        make.right.mas_equalTo(self.bookNameLabel.mas_right);
        make.top.mas_equalTo(self.accuracyLabel.mas_bottom).mas_offset(30);
        make.height.mas_equalTo(20);
        
    }];
}
















@end
