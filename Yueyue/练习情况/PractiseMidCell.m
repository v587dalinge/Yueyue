//
//  PractiseMidCell.m
//  Yueyue
//
//  Created by Weenie Wang on 2018/1/24.
//  Copyright © 2018年 guilin. All rights reserved.
//

#import "PractiseMidCell.h"
#import <Masonry.h>

@interface PractiseMidCell()
/** 背景 */
@property (nonatomic,weak) UIView *bgView;
/** leftLabel */
@property (nonatomic,weak) UILabel *leftLabel;
/** <#descrip#> */
@property (nonatomic,weak) UIView *btnBGView;
/** <#descrip#> */
@property (nonatomic,weak) UIButton *rightBtn;
/** <#descrip#> */
@property (nonatomic,weak) UIButton *wrongBtn;

@end

@implementation PractiseMidCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_s"]];
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
    
    
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.backgroundColor = [UIColor redColor];
    leftLabel.font = [UIFont systemFontOfSize:14];
    leftLabel.text = @"答对1题/共3题";
    self.leftLabel = leftLabel;
    [self.bgView addSubview:leftLabel];
    
    UIView *btnBGView = [[UIView alloc] init];
    btnBGView.backgroundColor = [UIColor whiteColor];
    self.btnBGView = btnBGView;
    [self.contentView addSubview:btnBGView];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn setTitle:@"  正确" forState:UIControlStateNormal];
    [rightBtn setImage:[self createImageWithColor:[UIColor greenColor] frame:CGRectMake(0, 0, 25, 25)] forState:UIControlStateNormal];
    self.rightBtn = rightBtn;
    [self.btnBGView addSubview:self.rightBtn];
    
    UIButton *wrongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [wrongBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    wrongBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [wrongBtn setTitle:@"  错误" forState:UIControlStateNormal];
    [wrongBtn setImage:[self createImageWithColor:[UIColor redColor] frame:CGRectMake(0, 0, 25, 25)] forState:UIControlStateNormal];
    self.wrongBtn = wrongBtn;
    [self.btnBGView addSubview:self.wrongBtn];
    
    
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-20);
        make.top.mas_equalTo(8);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(self.bgView.mas_centerY);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(30);
    }];
    
    [self.btnBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftLabel.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.bgView.mas_right).mas_offset(-20);
        make.centerY.mas_equalTo(self.bgView.mas_centerY);
        make.height.mas_equalTo(40);
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(self.btnBGView.mas_width).multipliedBy(0.5);
        
    }];
    
    [self.wrongBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(self.btnBGView.mas_width).multipliedBy(0.5);
        
    }];
    
    
}


- (UIImage *)createImageWithColor:(UIColor *)color frame:(CGRect)rect

{
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
    
}









@end
