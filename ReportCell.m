//
//  ReportCell.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-22.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "ReportCell.h"

@implementation ReportCell

- (void)awakeFromNib
{
    // Initialization code
}

-(void)setModel:(Model *)model
{
    self.cell1.text = model.title;
    self.cell2.text = model.source;
    self.cell3.text = model.normal;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
