//
//  FamilyViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-10-9.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "FamilyViewController.h"
#import "TitleView.h"
@interface FamilyViewController ()
{
    //成员姓名
    UITextField *_tf;
}
@end

@implementation FamilyViewController

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
    
    _tf = [[UITextField alloc] initWithFrame:CGRectMake(20, KTitleHeight + 10, 150, 30)];
    _tf.placeholder = @"请输入姓名";
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_tf];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"家庭成员";
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

//click
-(void)click
{
    if (_delegate && [_delegate respondsToSelector:@selector(postStr:)])
    {
        [_delegate postStr:_tf.text];
    }
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
