//
//  SMRotaryWheel.m
//  RotaryWheelProject
//
//  Created by cesarerocchi on 2/10/12.
//  Copyright (c) 2012 studiomagnolia.com. All rights reserved.

#import <UIKit/UIKit.h>
#import "SMClove.h"

@interface HPieChartView : UIView 

//添加控件
@property(nonatomic,strong) UILabel *label1;
@property(nonatomic,strong) UILabel *label2;
@property(nonatomic,strong) UILabel *label3;
@property(nonatomic,assign,readonly) CGFloat bmi;

@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) NSMutableArray *cloves;
@property CGAffineTransform startTransform;
@property CGPoint wheelCenter;
@property (nonatomic ,retain) NSMutableArray * pie;

- (id) initWithFrame:(CGRect)frame withNum:(int)num withArray:(NSMutableArray *)array;
- (void) initWheel;
- (void) buildClovesOdd;
- (float) calculateDistanceFromCenter:(CGPoint)point;


@end
