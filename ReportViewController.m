//
//  ReportViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-22.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//
#define KTitleHeight 65

#import "CurveLineViewController.h"
#import "ReportViewController.h"
#import "TitleView.h"
#import "Model.h"
#import "ReportCell.h"
#import "HeadView.h"
@interface ReportViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tab;
    NSMutableArray *_dataArr;
    NSMutableArray *_titleArr;
    //名称
    NSMutableArray *_arr;
    //测量值
    NSMutableArray *_sourceArr;
    //正常范围
    NSMutableArray *_normalArr;
}
@end

@implementation ReportViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dataArr = [NSMutableArray array];
        _titleArr = [NSMutableArray array];
        _arr = [NSMutableArray array];
        _sourceArr = [NSMutableArray array];
        _normalArr = [NSMutableArray array];
        [_titleArr addObjectsFromArray:@[@"体重",@"BMI",@"体脂率",@"皮下脂肪",@"骨骼重量",@"肌肉比例",@"水含量",@"基础代谢",@"内脏脂肪",@"身体年龄"]];
        
        for (int i = 0; i < _titleArr.count; i++)
        {
            Model *model = [[Model alloc] init];
            model.title = _titleArr[i];
            model.source = [NSString stringWithFormat:@"%i",i + 1];
            model.normal = [NSString stringWithFormat:@"%i ~ %i", i + 1,i + 100];
            [_arr addObject:model];
            [_sourceArr addObject:model];
            [_normalArr addObject:model];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [_dataArr insertObject:[NSString stringWithFormat:@"%.1f",self.f] atIndex:0];
    [self createTitleView];
    [self createTab];
}

//createTab
-(void)createTab
{
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, KTitleHeight, self.view.frame.size.width, self.view.frame.size.height - KTitleHeight) style:UITableViewStylePlain];
    _tab.delegate = self;
    _tab.dataSource = self;
    _tab.bounces = NO;
    _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tab registerNib:[UINib nibWithNibName:@"ReportCell" bundle:nil] forCellReuseIdentifier:@"ReportCell"];
    [self.view addSubview:_tab];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"Report";
    view.myLabel.frame = CGRectMake(130, 20, 100, 50);
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
    return _titleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReportCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReportCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Model *model = _arr[indexPath.row];
    cell.cell2.textColor = Color(250, 203, 101);
    cell.cell3.textColor = Color(250, 203, 101);
    cell.cell2.font = [UIFont systemFontOfSize:20];
    cell.cell1.text = model.title;
    cell.cell2.text = model.source;
    cell.cell3.text = model.normal;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeadView *view = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.layer.cornerRadius = 5;
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CurveLineViewController *cur = [[CurveLineViewController alloc] init];
    cur.title = _titleArr[indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cur animated:YES];
    self.hidesBottomBarWhenPushed = YES;
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
