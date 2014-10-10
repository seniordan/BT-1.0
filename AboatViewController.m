//
//  AboatViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-28.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "AboatViewController.h"
#import "TitleView.h"
@interface AboatViewController ()

@end

@implementation AboatViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleView];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, KTitleHeight, self.view.bounds.size.width, self.view.bounds.size.height - KTitleHeight)];
    img.image = [UIImage imageNamed:@"activity_settings_about"];
    [self.view addSubview:img];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.placeBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"关于我们";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.searchBtn.hidden = YES;
    [view setButton:view.placeBtn andImg:@"back" withRect:CGRectMake(0, 20, 50, 50)];
    [self.view addSubview:view];
}

-(void)click
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
