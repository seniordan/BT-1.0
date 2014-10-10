//
//  SelfViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-10-9.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "SelfViewController.h"
#import "TitleView.h"
#import "SelfCell.h"
#import "TCell.h"
@interface SelfViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tab;
    NSMutableArray *_dataArr;
    NSMutableArray *_titleArr;
}
@end

@implementation SelfViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dataArr = [NSMutableArray array];
        [_dataArr addObjectsFromArray:@[@"火影忍者",@"NARUTO",@"男",@"北京",@"180CM",@"1990-01-01"]];
        _titleArr = [NSMutableArray array];
        [_titleArr addObjectsFromArray:@[@"用户名",@"账号",@"性别",@"所在地",@"身高",@"生日"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTitleView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTab];
}

-(void)createTab
{
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, KTitleHeight, self.view.bounds.size.width, 44 * 7) style:UITableViewStylePlain];
    _tab.dataSource = self;
    _tab.delegate = self;
    [_tab registerNib:[UINib nibWithNibName:@"SelfCell" bundle:nil] forCellReuseIdentifier:@"SelfCell"];
    [_tab registerNib:[UINib nibWithNibName:@"TCell" bundle:nil] forCellReuseIdentifier:@"TCell"];
    [self.view addSubview:_tab];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"个人账号";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

//titleView左边button事件
-(void)click
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        SelfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelfCell"];
        cell.myTitle.text = @"头像";
        return cell;
    }
    else if (indexPath.row > 0)
    {
        TCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TCell"];
        cell.myTitle.text = _titleArr[indexPath.row - 1];
        cell.myDes.text = _dataArr[indexPath.row - 1];
        return cell;
    }
    else
    {
        SelfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelfCell"];
        cell.myTitle.text = @"头像";
        return cell;
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
