//
//  ZDViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-23.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "ZDViewController.h"
#import "TitleView.h"
@interface ZDViewController ()

@end

@implementation ZDViewController

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self createTitleView];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"各种推荐";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(0, 20, 80, 50)];
    [self.view addSubview:view];
}

//click
-(void)click
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1]  animated:YES];
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
