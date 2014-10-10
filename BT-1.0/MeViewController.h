//
//  MeViewController.h
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDGoalBar.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface MeViewController : UIViewController<CBCentralManagerDelegate,CBPeripheralDelegate>
@property (strong, nonatomic) KDGoalBar *firstGoalBar;
@property (copy , nonatomic) NSString *isYES;

@property (nonatomic, strong) CBCentralManager *manager;
@property (nonatomic, strong) CBPeripheral *peripheral;

@property (strong,nonatomic) NSMutableArray *nDevices;
@property (nonatomic,strong) UILabel *ll;

@end
