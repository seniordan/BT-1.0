//
//  MeViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//
#define HAS_LOGIN (@"has_login")
#define kUUID @"81AE1C63-2EB0-812C-8A4F-0AF118C22219"

#import "MeViewController.h"
#import "LogiViewController.h"
#import "ReportViewController.h"
#import "FamilyViewController.h"
#import "TitleView.h"

@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,PostStrDelegate>
{
    UIImageView *_little;
    UIImageView *_imgView;
    double angle;
    UILabel *_l;
    CGFloat _f;
    UIButton *_bb;
    
    UITableView *_tab;
    NSMutableArray *_dataArr;
    BOOL _isOK;
    
    TitleView *_view;
    UIImageView *_downImg;
}
@end

@implementation MeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {
            [self.manager stopScan];
            [_firstGoalBar setPercent:0.0 animated:NO];
            _ll.text = @"BMI:0.0";
            if (_isOK == NO)
            {
                [self goClick];
            }
        }
            break;
        case 1:
        {
            [self.manager stopScan];
            [_firstGoalBar setPercent:0.0 animated:NO];
            _ll.text = @"BMI:0.0";
            UIAlertView *aView = [[UIAlertView alloc] initWithTitle:nil message:@"保存成功" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
            [aView show];
            [self goClick];
            if (_isOK == NO)
            {
                [self goClick];
            }
            break;
        }
        default:
            NSLog(@"3");
            break;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *loginFlag = [[NSUserDefaults standardUserDefaults] objectForKey:HAS_LOGIN];
    if (loginFlag == nil || [loginFlag isEqualToString:@"NO"])
    {
        [self presentViewController:[[LogiViewController alloc] init] animated:NO completion:nil];
    }
}

- (void)viewDidUnload
{
    [self setFirstGoalBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataArr = [NSMutableArray array];
    [_dataArr addObjectsFromArray:@[@"我"]];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleView];
    
    UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(0, KTitleHeight, self.view.bounds.size.width, self.view.bounds.size.height - 44 - KTitleHeight)];
    v.image = [UIImage imageNamed:@"fragment_main_myself_bg"];
    v.alpha = .5;
    [self.view addSubview:v];
    
    _little.hidden = YES;
    //蓝牙
    self.nDevices = [[NSMutableArray alloc]init];
    _manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    [self performSelector:@selector(goClick) withObject:nil afterDelay:.1];
    
    [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector:@selector(goClick) userInfo: nil repeats: YES];
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 74, 243, 243)];
    _imgView.image = [UIImage imageNamed:@"fragment_main_myself_scale"];
    [self.view addSubview:_imgView];
    
    [UIView animateWithDuration:.5 animations:^{
        _imgView.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5 animations:^{
            _imgView.transform = CGAffineTransformMakeRotation(M_PI * 2);
        }];
    }];
    
    _firstGoalBar = [[KDGoalBar alloc] initWithFrame:CGRectMake(73, 107, 177, 203)];
    [_firstGoalBar setAllowDragging:YES];
    [_firstGoalBar setAllowSwitching:NO];
    [_firstGoalBar setPercent:0.0 animated:NO];
    [self.view addSubview:_firstGoalBar];
    
    _ll = [[UILabel alloc] initWithFrame:CGRectMake(130, 215, 80, 25)];
    _ll.text = @"BMI:0.0";
    _ll.textColor = [[UIColor alloc] initWithRed:150 % 256 / 255.0 green:150 % 256 / 255.0 blue:150 % 256 / 255.0 alpha:1];
    [self.view addSubview:_ll];
    
    UIImageView *main = [[UIImageView alloc] initWithFrame:CGRectMake(40, _imgView.frame.origin.y + _imgView.frame.size.height + 5, 245, 65)];
    main.image = [UIImage imageNamed:@"fragment_main_myself_test2"];
    main.alpha = .6;
    [self.view addSubview:main];
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(55, main.frame.origin.y + 5, 25, 25)];
    view.image = [UIImage imageNamed:@"fragment_main_myself_notices"];
    [self.view addSubview:view];
    
    _l = [[UILabel alloc] initWithFrame:CGRectMake(90, main.frame.origin.y + 5, 190, 60)];
    _l.font = [UIFont systemFontOfSize:16];
    _l.numberOfLines = 3;
    _l.text = @"身体保养建议:多喝水、勤走路,适当增加户外有氧运动。";
    [self.view  addSubview:_l];
    
//    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    b.layer.cornerRadius = 8;
//    b.frame = CGRectMake(view.frame.origin.x, _l.frame.origin.y + _l.frame.size.height + 10, 260, 40);
//    b.backgroundColor = [[UIColor alloc] initWithRed:121 % 256 / 255.0 green:185 % 256 / 255.0 blue:26 % 256 / 255.0 alpha:1];
//    [b setTitle:@"LET’S GO!" forState:UIControlStateNormal];
//    [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    b.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:25];
//    [b addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:b];
}

-(void)go
{
    [_firstGoalBar setPercent:0.0 animated:NO];
    [self goClick];
}

#pragma mark - CBCentralManagerDelegate
-(void)centralManagerDidUpdateState:(CBCentralManager *)central {
    //cbReady = false;
    switch (central.state) {
        case CBCentralManagerStatePoweredOff:
            [self updateLog:@"CoreBluetooth BLE hardware is Powered off"];
            
            break;
        case CBCentralManagerStatePoweredOn:
            [self updateLog:@"CoreBluetooth BLE hardware is Powered on and ready"];
            
            [_manager scanForPeripheralsWithServices:
             @[ [CBUUID UUIDWithString:@"FFF0"] ]
                                             options:@{CBCentralManagerScanOptionAllowDuplicatesKey :
                                                           @YES }];
            
            //cbReady = true;
        case CBCentralManagerStateResetting:
            
            [self updateLog:@"CoreBluetooth BLE hardware is resetting"];
            break;
        case CBCentralManagerStateUnauthorized:
            
            [self updateLog:@"CoreBluetooth BLE state is unauthorized"];
            break;
        case CBCentralManagerStateUnknown:
            
            [self updateLog:@"CoreBluetooth BLE state is unknown"];
            break;
        case CBCentralManagerStateUnsupported:
            
            [self updateLog:@"CoreBluetooth BLE hardware is unsupported on this platform"];
            break;
        default:
            break;
    }
}

//已发现从机设备
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    if ([advertisementData objectForKey:@"kCBAdvDataManufacturerData"])
    {
        NSData *data = [advertisementData objectForKey:@"kCBAdvDataManufacturerData"];
        //    NSString *str = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        NSString *s = [NSString stringWithFormat:@"%@",data];
        //截取字符串 从第3个开始取4个
        NSString *str = [s substringWithRange:NSMakeRange(3, 4)];
        NSString *ss = [s substringWithRange:NSMakeRange(7, 2)];
        //16进制转化10进制方法
        int i = strtoul([[str substringWithRange:NSMakeRange(0, 4)] UTF8String], 0, 16);
        _f = (CGFloat)i / 100;
        
        //体重值
        [_firstGoalBar setPercent:_f animated:NO];
        _ll.text = [NSString stringWithFormat:@"BMI:%.1f",_f / (1.70 * 1.70)];
    
        if ([ss isEqualToString:@"0a"])
        {
            [self.manager stopScan];
            [self.manager connectPeripheral:peripheral options:nil];
            _isOK = YES;
            [_dataArr addObject:[NSString stringWithFormat:@"%1.f",_f]];
            UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"需要保存当前体重吗？" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"确定", nil];
            [view show];
        }

        BOOL replace = NO;
        for (int ii=0; ii < self.nDevices.count; ii++) {
            CBPeripheral *p = [self.nDevices objectAtIndex:ii];
            if ([p isEqual:peripheral]) {
                [self.nDevices replaceObjectAtIndex:ii withObject:peripheral];
                replace = YES;
            }
        }
        if (!replace) {
            if ([peripheral.name isEqualToString:@"Chipsea-BLE"]) {
                [self.nDevices addObject:peripheral];
                [self updateLog:@"has found Chipsea-BLE！\r\n"];
                
                self.peripheral = peripheral;
            }
        }
    }
}

-(void)updateLog:(NSString *)s
{
    static unsigned int count = 0;
    NSLog(@"[%d] %@\r\n",count,s);
    count++;
}

//实现自动旋转
-(void)transformAction {
    angle = angle + 0.01;//angle角度 double angle;
    if (angle > 6.28) {//大于 M_PI*2(360度) 角度再次从0开始
        angle = 0;
    }
    CGAffineTransform transform=CGAffineTransformMakeRotation(angle);
    _imgView.transform = transform;
}

//goClick
-(void)goClick
{
    [_manager scanForPeripheralsWithServices:nil options:@{CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
    
    double delayInSeconds = 30.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.manager stopScan];
        //        [_firstGoalBar setPercent:0.0 animated:NO];
        // [self updateLog:@"扫描超时,停止扫描"];
    });
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    _view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [_view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    _view.myLabel.text = @"我";
    _view.myLabel.frame = CGRectMake(150, 20, 50, 40);
    _view.myLabel.font = [UIFont fontWithName:@"Arial" size:20];
    _view.myLabel.textAlignment = NSTextAlignmentCenter;
//    _view.myLabel.backgroundColor = [UIColor redColor];
    UIFont *font = [UIFont fontWithName:@"Arial" size:20];//跟label的字体大小一样
    CGSize size = CGSizeMake(29999, 50);//跟label的宽设置一样
    if (is_IOS_7)
    {
        NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        
        size =[_view.myLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
        _view.myLabel.frame = CGRectMake(150, 20, size.width, 50);
    }
    else
    {
        size = [_view.myLabel.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];//ios7以上已经摒弃的这个方法
    }
    
    _view.imgView.hidden = YES;
    [_view setButton:_view.searchBtn andTitle:@"Report" withRect:CGRectMake(0, 20, 80, 50)];
 
    [_view setButton:_view.placeBtn andImg:@"fragment_main_myself_graph" withRect:CGRectMake(280, 30, 30, 30)];
    [self.view addSubview:_view];
    
    _little = [[UIImageView alloc] initWithFrame:CGRectMake(_view.myLabel.frame.origin.x + 5, KTitleHeight - 5, 10, 5)];
    _little.image = [UIImage imageNamed:@"pop_window_up_row"];
    [self.view addSubview:_little];
    
    _downImg = [[UIImageView alloc] initWithFrame:CGRectMake(_view.myLabel.frame.origin.x + _view.myLabel.frame.size.width + 10, _view.myLabel.frame.origin.y + 20, 10, 10)];
    _downImg.image = [UIImage imageNamed:@"popwindow_row"];
    [self.view addSubview:_downImg];
    
    //透明按钮
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    b.frame = CGRectMake(_view.myLabel.frame.origin.x, _view.frame.origin.y, 60, 60);
    b.alpha = .1;
    [b addTarget:self action:@selector(kClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
}

-(void)kClick
{
    [self createTab];
    //    _tab.hidden = NO;
    _little.hidden = NO;
    _bb = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _bb.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    _bb.backgroundColor = [[UIColor alloc] initWithRed:50 % 256 / 255.0 green:50 % 256 / 255.0 blue:50 % 256 / 255.0 alpha:.1];
    [_bb addTarget:self action:@selector(bbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bb];
    [self.view bringSubviewToFront:_tab];
    [self.view bringSubviewToFront:_little];
}

//_bb事件
-(void)bbtn
{
    [UIView animateWithDuration:.5 animations:^{
        _tab.hidden = YES;
        _bb.hidden = YES;
        _little.hidden = YES;
    }];
}

-(void)createTab
{
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(80, KTitleHeight, 160, 88) style:UITableViewStylePlain];
    _tab.delegate = self;
    _tab.dataSource = self;
//    _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [_tab registerNib:[UINib nibWithNibName:@"MakeCell" bundle:nil] forCellReuseIdentifier:@"MakeCell"];
    [self.view addSubview:_tab];
}

//click
-(void)click
{
    ReportViewController *report = [[ReportViewController alloc] init];
    report.f = _f;
    NSLog(@">>>>>%.1f",_f);
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:report animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    if (indexPath.row == 0)
    {
        cell.textLabel.text = _dataArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    else if(indexPath.row > 0 && indexPath.row < _dataArr.count)
    {
        cell.textLabel.text = _dataArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    else if (indexPath.row == _dataArr.count)
    {
        cell.textLabel.text = @"添加成员";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        _tab.hidden = YES;
        _little.hidden = YES;
        _bb.hidden = YES;
        
        [UIView animateWithDuration:.3 animations:^{
            _view.myLabel.text = [_dataArr objectAtIndex:0];
            _view.myLabel.frame = CGRectMake(150, 20, 50, 40);
            _view.myLabel.font = [UIFont fontWithName:@"Arial" size:20];
            _view.myLabel.textAlignment = NSTextAlignmentCenter;
            //    _view.myLabel.backgroundColor = [UIColor redColor];
            UIFont *font = [UIFont fontWithName:@"Arial" size:20];//跟label的字体大小一样
            CGSize size = CGSizeMake(29999, 50);//跟label的宽设置一样
            if (is_IOS_7)
            {
                NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
                
                size =[_view.myLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
                _view.myLabel.frame = CGRectMake(150, 20, size.width, 50);
                _downImg.frame  = CGRectMake(_view.myLabel.frame.origin.x + _view.myLabel.frame.size.width + 10, _view.myLabel.frame.origin.y + 20, 10, 10);
            }
            else
            {
                size = [_view.myLabel.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];//ios7以上已经摒弃的这个方法
            }
        }];
    }
    
    else if (indexPath.row > 0 && indexPath.row < _dataArr.count)
    {
        _tab.hidden = YES;
        _little.hidden = YES;
        _bb.hidden = YES;
        
        [UIView animateWithDuration:.3 animations:^{
            _view.myLabel.text = _dataArr[indexPath.row];
            _view.myLabel.frame = CGRectMake(150, 20, 50, 40);
            _view.myLabel.font = [UIFont fontWithName:@"Arial" size:20];
            _view.myLabel.textAlignment = NSTextAlignmentCenter;
            //    _view.myLabel.backgroundColor = [UIColor redColor];
            UIFont *font = [UIFont fontWithName:@"Arial" size:20];//跟label的字体大小一样
            CGSize size = CGSizeMake(29999, 50);//跟label的宽设置一样
            if (is_IOS_7)
            {
                NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
                
                size =[_view.myLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
                _view.myLabel.frame = CGRectMake(120, 20, size.width, 50);
                _downImg.frame = CGRectMake(_view.myLabel.frame.origin.x + size.width + 8, _view.myLabel.frame.origin.y + 20, 10, 10);
            }
            else
            {
                size = [_view.myLabel.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];//ios7以上已经摒弃的这个方法
            }
        }];

    }
    
    else if (indexPath.row == _dataArr.count)
    {
        _tab.hidden = YES;
        _little.hidden = YES;
        _bb.hidden = YES;
        FamilyViewController *family = [[FamilyViewController alloc] init];
        family.delegate = self;
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:family animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if (indexPath.row < _dataArr.count)
        {
            [_dataArr removeObjectAtIndex:indexPath.row];
            [_tab deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return NO;
    }
    else if (indexPath.row == _dataArr.count)
    {
        return NO;
    }
    return YES;
}

#pragma mark - PostStrDelegate
-(void)postStr:(NSString *)str
{
    [_dataArr addObject:str];
    [_tab reloadData];
    _view.myLabel.text = str;
    UIFont *font = [UIFont fontWithName:@"Arial" size:20];//跟label的字体大小一样
    CGSize size = CGSizeMake(29999, 50);//跟label的宽设置一样
    if (is_IOS_7)
    {
        NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        
        size =[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
        _view.myLabel.frame = CGRectMake(120, 20, size.width, 50);
        _downImg.frame = CGRectMake(_view.myLabel.frame.origin.x + size.width + 8, _view.myLabel.frame.origin.y + 20, 10, 10);
    }
    else
    {
        size = [str sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];//ios7以上已经摒弃的这个方法
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
