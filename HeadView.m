//
//  HeadView.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-22.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView
{
    UILabel *_l1;
    UILabel *_l2;
    UILabel *_l3;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _l1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 107, 20)];
        _l1.text = @"名称";
        _l1.textAlignment = NSTextAlignmentCenter;
        _l1.textColor = [UIColor whiteColor];
        [self addSubview:_l1];
        
        _l2 = [[UILabel alloc] initWithFrame:CGRectMake(106, 5, 108, 20)];
        _l2.text = @"测量值";
        _l2.textAlignment = NSTextAlignmentCenter;
        _l2.textColor = [UIColor whiteColor];
        [self addSubview:_l2];
        
        _l3 = [[UILabel alloc] initWithFrame:CGRectMake(212, 5, 108, 20)];
        _l3.text = @"正常范围";
        _l3.textAlignment = NSTextAlignmentCenter;
        _l3.textColor = [UIColor whiteColor];
        [self addSubview:_l3];
        
        self.backgroundColor = Color(243, 167, 9);
    }
    return self;
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
