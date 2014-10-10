//
//  TitleView.h
//  BTControl
//
//  Created by ChipSea on 14-9-9.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView
@property(nonatomic,weak) UIButton *placeBtn;
@property(nonatomic,weak) UIButton *searchBtn;
@property(nonatomic,strong) UILabel *myLabel;
@property(nonatomic,strong) UIImageView *imgView;

-(void)setButton:(UIButton *)b andTitle:(NSString *)str withRect:(CGRect)rect;

-(void)setButton:(UIButton *)b andImg:(UIImage *)img andSelectedImg:(UIImage *)selectedImg;

-(void)setButton:(UIButton *)b andInsertImg:(UIImage *)img andString:(NSString *)str;

-(void)setButton:(UIButton *)b andImg:(NSString *)img withRect:(CGRect)rect;
@end
