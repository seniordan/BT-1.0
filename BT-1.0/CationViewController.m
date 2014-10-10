//
//  CationViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "CationViewController.h"
#import "FriendViewController.h"
#import "GroupViewController.h"
#import "TitleView.h"
@interface CationViewController ()

@end

@implementation CationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self createTitleView];
    
    NSArray *img = @[@"fragment_main_socialclub_content1",@"fragment_main_socialclub_content2"];
    for (int i = 0; i < 2; i++)
    {
        UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
        b.frame = CGRectMake(85, 80 + 180 * i, 150, 150);
        b.tag = 10000 + i;
        b.layer.cornerRadius = 8;
        b.clipsToBounds = YES;
        [b setBackgroundImage:[UIImage imageNamed:img[i]] forState:UIControlStateNormal];
        [b addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:b];
    }
}

-(void)btn:(UIButton *)b
{
    switch (b.tag)
    {
        case 10000:
        {
            FriendViewController *fr = [[FriendViewController alloc] init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fr animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
        case 10001:
        {
            GroupViewController *gr = [[GroupViewController alloc] init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:gr animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
        default:
            break;
    }
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"交际圈";
    view.myLabel.frame = CGRectMake(130, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"未定" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

-(void)click
{
    NSLog(@"下一页");
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
