//
//  HealthViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#define KCOLX 40
#define KCOLY 74

#import "HealthViewController.h"
#import "KeepViewController.h"
#import "TitleView.h"
#import "CustomCell.h"
@interface HealthViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_col;
    NSMutableArray *_dataArr;
    NSMutableArray *_titleArr;
    NSMutableArray *_imgArr;
}
@end

@implementation HealthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dataArr = [NSMutableArray array];
        _titleArr = [NSMutableArray array];
        [_titleArr addObjectsFromArray:@[@"养生推荐",@"健身推荐",@"纤体推荐",@"女生推荐",@"宝宝推荐"]];
        _dataArr = [NSMutableArray arrayWithArray:@[@"fragment_main_health_content1",@"fragment_main_health_content2",@"fragment_main_health_content3",@"fragment_main_health_content4",@"fragment_main_health_content5"]];
        
        _imgArr = [NSMutableArray array];
        [_imgArr addObjectsFromArray:@[@"activity_health_healthtips_logo",@"activity_health_gym_logo",@"activity_health_girls_logo",@"activity_health_slim_logo",@"activity_health_babys_logo"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleView];
    
    UICollectionViewFlowLayout *f = [[UICollectionViewFlowLayout alloc] init];
    f.itemSize = CGSizeMake(100, 100);
    _col = [[UICollectionView alloc] initWithFrame:CGRectMake(KCOLX, KCOLY, self.view.bounds.size.width - 2 * KCOLX, self.view.bounds.size.height - 44 - 94) collectionViewLayout:f];
    _col.backgroundColor = [UIColor whiteColor];
    [_col registerClass:[CustomCell class] forCellWithReuseIdentifier:@"CustomCell"];
    _col.dataSource = self;
    _col.delegate = self;
    _col.bounces = NO;
    [self.view addSubview:_col];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"健康推荐";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"未定" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

-(void)click
{
    NSLog(@"gogogo...");
}

#pragma mark - CollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.myImg.image = [UIImage imageNamed:_dataArr[indexPath.row]];
    cell.myImg.layer.cornerRadius = 8;
    cell.myImg.clipsToBounds = YES;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    KeepViewController *keep = [[KeepViewController alloc] init];
    keep.title = _titleArr[indexPath.row];
    keep.img = _imgArr[indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keep animated:YES];
    self.hidesBottomBarWhenPushed = NO;
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
