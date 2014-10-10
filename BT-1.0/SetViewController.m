//
//  SetViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#define kTABY 74

#import "SetViewController.h"
#import "LogiViewController.h"
#import "AboatViewController.h"
#import "SelfViewController.h"
#import "FeedbackViewController.h"
#import "TitleView.h"
#import "Model.h"
#import "MyCell.h"
@interface SetViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tab;
    NSMutableArray *_dataArr;
    NSMutableArray *_secArr;
    NSMutableArray *_seArr;
    NSMutableArray *_thirdArr;
}
@end

@implementation SetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dataArr = [NSMutableArray array];
        Model *model = [[Model alloc] init];
        model.img = @"items_settings_listview_img1";
        model.title = @"火影忍者";
        model.source = @"zhxaaa@chipsea.com";
        [_dataArr insertObject:model atIndex:0];
        
        Model *m = [[Model alloc] init];
        m.title = @"用户反馈";
        m.img = @"items_settings_listview_img2";
        [_dataArr insertObject:m atIndex:1];
        
        Model *mod = [[Model alloc] init];
        mod.title = @"关于我们";
        mod.img = @"items_settings_listview_img3";
        [_dataArr insertObject:mod atIndex:2];
        
        Model *mo = [[Model alloc] init];
        mo.img = @"items_settings_listview_img4";
        mo.title = @"退出登录";
        [_dataArr insertObject:mo atIndex:3];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleView];
    [self creatTableView];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"个性设置";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"未定" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

//titleView左边button事件
-(void)click
{
    NSLog(@"未定...");
}

//creatTableView
-(void)creatTableView
{
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, kTABY, self.view.bounds.size.width, self.view.bounds.size.height - kTABY - 44) style:UITableViewStylePlain];
    _tab.delegate = self;
    _tab.dataSource = self;
    _tab.bounces = NO;
    _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tab registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    [self.view addSubview:_tab];
}

#pragma mark -tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
            Model *model = _dataArr[indexPath.row];
            [cell getModel:model];
            return cell;
        }
            break;
        case 1:
        {
            MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
            Model *model = _dataArr[indexPath.row];
            [cell makeModel:model];
            return cell;
        }
        case 2:
        {
            MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
            Model *model = _dataArr[indexPath.row];
            [cell makeModel:model];
            return cell;
        }
            break;
        case 3:
        {
            MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
            Model *model = _dataArr[indexPath.row];
            [cell refreshModel:model];
            return cell;
        }
            break;
        default:
        {
            MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
            Model *model = _dataArr[indexPath.row];
            [cell refreshModel:model];
            return cell;
        }
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        SelfViewController *selfVC = [[SelfViewController alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:selfVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    
    if (indexPath.row == 1)
    {
        FeedbackViewController *feed = [[FeedbackViewController alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:feed animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    
    if (indexPath.row == 2)
    {
        AboatViewController *ab = [[AboatViewController alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ab animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    
    if (indexPath.row == 3)
    {
        LogiViewController *lo = [[LogiViewController alloc] init];
        lo.isYES = @"YES";
        self.hidesBottomBarWhenPushed = YES;
        [self presentViewController:lo animated:YES completion:nil];
        self.hidesBottomBarWhenPushed = NO;
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
