//
//  MyCell.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-22.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
{
    __weak IBOutlet UIImageView *myImg;
    __weak IBOutlet UILabel *myTitle;
    
    __weak IBOutlet UILabel *myName;
    __weak IBOutlet UIImageView *myArrow;
}
- (void)awakeFromNib
{
    // Initialization code
}

-(void)getModel:(Model *)model
{
    myImg.image = [UIImage imageNamed:model.img];
    myTitle.text = model.title;
    myName.text = model.source;
}

-(void)makeModel:(Model *)model
{
    myName.hidden = YES;
    myImg.image = [UIImage imageNamed:model.img];
    myTitle.frame = CGRectMake(58, 19, 205, 21);
    myTitle.text = model.title;
}

-(void)refreshModel:(Model *)model
{
    myName.hidden = YES;
    myImg.image = [UIImage imageNamed:model.img];
    myTitle.frame = CGRectMake(58, 19, 205, 21);
    myTitle.text = model.title;
    myArrow.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
