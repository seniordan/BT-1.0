//
//  MyCell.h
//  BT-1.0
//
//  Created by ChipSea on 14-9-22.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface MyCell : UITableViewCell
-(void)getModel:(Model *)model;
-(void)makeModel:(Model *)model;
-(void)refreshModel:(Model *)model;
@end
