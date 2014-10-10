//
//  TitleView.m
//  BTControl
//
//  Created by ChipSea on 14-9-9.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

//                   _ooOoo_
//                  o8888888o
//                  88" . "88
//                  (| -_- |)
//                  O\  =  /O
//               ____/`---'\____
//             .'  \\|     |//  `.
//            /  \\|||  :  |||//  \
//           /  _||||| -:- |||||-  \
//           |   | \\\  -  /// |   |
//           | \_|  ''\---/''  |   |
//           \  .-\__  `-`  ___/-. /
//         ___`. .'  /--.--\  `. . __
//      ."" '<  `.___\_<|>_/___.'  >'"".
//     | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//     \  \ `-.   \_ __\ /__ _/   .-` /  /
//======`-.____`-.___\_____/___.-`____.-'======
//                   `=---='
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//         佛祖保佑       永无BUG

#import "TitleView.h"

@implementation TitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 65)];
        view.backgroundColor = [[UIColor alloc] initWithRed:121 % 256 / 255.0 green:185 % 256 / 255.0 blue:26 % 256 / 255.0 alpha:1];
        [self addSubview:view];
        
        _placeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _placeBtn.frame = CGRectMake(0, 20, 50, 50);
//        [_placeBtn setImage:[UIImage imageNamed:@"bt_input_weight_unfocused"] forState:UIControlStateNormal];
//        [_placeBtn setImage:[UIImage imageNamed:@"bt_input_weight_focused"] forState:UIControlStateSelected];
//        [_placeBtn setTitle:@"Report" forState:UIControlStateNormal];
        [self addSubview:_placeBtn];
        
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_searchBtn setImage:[UIImage imageNamed:@"bt_historical_weight_unfocused"] forState:UIControlStateNormal];
//        [_searchBtn setImage:[UIImage imageNamed:@"bt_historical_weight_focused"] forState:UIControlStateSelected];
//        [self setButton:_searchBtn andImg:[UIImage imageNamed:@"bt_historical_weight_unfocused"] andSelectedImg:[UIImage imageNamed:@"bt_historical_weight_focused"]];
        _searchBtn.frame = CGRectMake(270, 20, 50, 50);
        [self addSubview:_searchBtn];
        
        _myLabel = [[UILabel alloc] init];
        _myLabel.frame = CGRectMake(150, 20, 50, 40);
        _myLabel.textColor = [UIColor whiteColor];
//        _myLabel.text = @"我";
        _myLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:_myLabel];
        
//        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(_myLabel.frame.origin.x + 30, 40, 10, 10)];
//        _imgView.image = [UIImage imageNamed:@"popwindow_row"];
//        [self addSubview:_imgView];
    }
    return self;
}

-(void)setButton:(UIButton *)b andImg:(NSString *)img withRect:(CGRect)rect
{
    b.frame = rect;
    [b setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
}

-(void)setButton:(UIButton *)b andTitle:(NSString *)str withRect:(CGRect)rect
{
    b.frame = rect;
    [b setTitle:str forState:UIControlStateNormal];
}

-(void)setButton:(UIButton *)b andImg:(UIImage *)img andSelectedImg:(UIImage *)selectedImg
{
//    b.frame = CGRectMake(0, 20, 90, 50);
    [b setImage:img forState:UIControlStateNormal];
    [b setImage:selectedImg forState:UIControlStateSelected];
}

-(void)setButton:(UIButton *)b andInsertImg:(UIImage *)img andString:(NSString *)str
{
    b.frame = CGRectMake(0, 20, 90, 50);
    [b setImage:img forState:UIControlStateNormal];
    [b setTitle:str forState:UIControlStateNormal];
    b.titleLabel.textAlignment = NSTextAlignmentRight;
//    b.titleLabel.textColor = [UIColor whiteColor];
//    b.titleLabel.font = [UIFont systemFontOfSize:15];
    [b setImageEdgeInsets:UIEdgeInsetsMake(15, 0, 10, 65)];
    [b setTitleEdgeInsets:UIEdgeInsetsMake(5, 25, 5, 0)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
