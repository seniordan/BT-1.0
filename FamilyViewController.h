//
//  FamilyViewController.h
//  BT-1.0
//
//  Created by ChipSea on 14-10-9.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PostStrDelegate <NSObject>

-(void)postStr:(NSString *)str;

@end

@interface FamilyViewController : UIViewController
@property(nonatomic,weak)id<PostStrDelegate>delegate;
@end

