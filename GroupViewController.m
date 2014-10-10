//
//  GroupViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-23.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "GroupViewController.h"
#import "TitleView.h"
#import "Cell3.h"
@interface GroupViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tab;
    UISearchBar *_search;
    NSMutableArray *_dataArr;
}
@end

@implementation GroupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dataArr = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [self createTitleView];
    [self createTab];
}

-(void)createTab
{
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, KTitleHeight, self.view.bounds.size.width, self.view.bounds.size.height - KTitleHeight) style:UITableViewStylePlain];
    _tab.dataSource = self;
    _tab.delegate = self;
    [_tab registerNib:[UINib nibWithNibName:@"Cell3" bundle:nil] forCellReuseIdentifier:@"Cell3"];
    [self.view addSubview:_tab];
    
    _search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    _search.placeholder = @"搜索...";
    _search.barStyle = UIBarStyleDefault;
    _tab.tableHeaderView = _search;
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"我的群组";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.imgView.hidden = YES;
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

//click
-(void)click
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
