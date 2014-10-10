//
//  ReportCell.h
//  BT-1.0
//
//  Created by ChipSea on 14-9-22.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface ReportCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cell1;

@property (weak, nonatomic) IBOutlet UILabel *cell2;

@property (weak, nonatomic) IBOutlet UILabel *cell3;

-(void)setModel:(Model *)model;
@end
