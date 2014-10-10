//
//  FeedbackViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-10-9.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "FeedbackViewController.h"
#import "TitleView.h"
@interface FeedbackViewController ()
{
    UITextField *_t1;
    UITextField *_t2;
    UITextField *_t3;
}
@end

@implementation FeedbackViewController

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
    [self createTitleView];
    self.view.backgroundColor = [UIColor whiteColor];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"用户反馈";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
    
    _t1 = [[UITextField alloc] initWithFrame:CGRectMake(20, KTitleHeight + 10, 220, 30)];
    _t1.placeholder = @"请输入用户名";
    _t1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_t1];
    
    _t2 = [[UITextField alloc] initWithFrame:CGRectMake(20, _t1.frame.origin.y + _t1.frame.size.height + 10, 220, 30)];
    _t2.placeholder = @"请输入手机号";
    _t2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_t2];
    
    _t3 = [[UITextField alloc] initWithFrame:CGRectMake(20, _t2.frame.origin.y + _t2.frame.size.height + 10, 220, 100)];
    _t3.placeholder = @"请输入留言信息";
    _t3.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_t3];
    
    UIButton *bb = [UIButton buttonWithType:UIButtonTypeCustom];
    bb.frame = CGRectMake(10, _t3.frame.origin.y + _t3.frame.size.height + 50, self.view.frame.size.width - 20, 40);
    //    [bb setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    bb.backgroundColor = [[UIColor alloc] initWithRed:121 % 256 / 255.0 green:185 % 256 / 255.0 blue:26 % 256 / 255.0 alpha:1];;
    [bb setTitle:@"提交" forState:UIControlStateNormal];
    [bb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bb.layer.cornerRadius = 8;
    self.view.clipsToBounds = YES;
    //    [bb setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 280)];
    //    [bb setTitleEdgeInsets:UIEdgeInsetsMake(5, -280, 5, 0)];
    [bb addTarget:self action:@selector(finishDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bb];
}

-(void)finishDown
{
    UIAlertView *aView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"感谢您对我们的支持，您的鼓励将会是我们前进的动力!" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
    [aView show];
}

//titleView左边button事件
-(void)click
{
    [self.navigationController popToRootViewControllerAnimated: YES];
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
