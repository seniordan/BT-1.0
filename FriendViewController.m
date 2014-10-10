//
//  FriendViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-23.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "FriendViewController.h"
#import "TitleView.h"
#import "FriendCell.h"
#import "Cell2.h"
@interface FriendViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tab;
    NSMutableArray *_dataArr;
}
@end

@implementation FriendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dataArr = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleView];
    [self createTab];
}

//createTab
-(void)createTab
{
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, KTitleHeight, self.view.bounds.size.width, self.view.bounds.size.height - KTitleHeight) style:UITableViewStylePlain];
    _tab.dataSource = self;
    _tab.delegate = self;
    [_tab registerNib:[UINib nibWithNibName:@"FriendCell" bundle:nil] forCellReuseIdentifier:@"FriendCell"];
    [_tab registerNib:[UINib nibWithNibName:@"Cell2" bundle:nil] forCellReuseIdentifier:@"Cell2"];
    [self.view addSubview:_tab];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"好友动态";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

//click
-(void)click
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Cell的按钮事件
-(void)talkBtn:(UIButton *)sender
{
    NSLog(@">>>%i",sender.tag);
}

#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
        cell.myImg.layer.cornerRadius = 8;
        cell.myImg.layer.borderWidth = 1;
        cell.myImg.layer.borderColor = [UIColor whiteColor].CGColor;
        cell.myImg.clipsToBounds = YES;
        
        cell.daren.layer.cornerRadius = cell.daren.frame.size.width / 2;
        cell.daren.clipsToBounds = YES;
        
        //btn
        cell.btn1.titleLabel.text = @"100";
        return cell;
    }
    else
    {
        Cell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        cell.Img.layer.cornerRadius = 8;
        cell.talkBtn.tag = indexPath.row + 1;
        [cell.talkBtn addTarget:self action:@selector(talkBtn:) forControlEvents:UIControlEventTouchUpInside];
        cell.Img.clipsToBounds = YES;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 200;
    }
    return 180;
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
