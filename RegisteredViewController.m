//
//  RegisteredViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//
#define kColor [[UIColor alloc] initWithRed:200 % 256 / 255.0 green:200 % 256 / 255.0 blue:200 % 256 / 255.0 alpha:1]

#import "RegisteredViewController.h"
#import "TitleView.h"
@interface RegisteredViewController ()<UITextFieldDelegate>
{
    NSInteger _num;
}
@end

@implementation RegisteredViewController

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
    NSArray *titleArr = @[@"用户昵称",@"邮箱",@"密码",@"确认密码",@"用户身高",@"用户性别",@"手机号码",@"验证码"];
    for (int i = 0; i < 8; i++)
    {
        UITextField *t = [[UITextField alloc] initWithFrame:CGRectMake(100, 84 + 40 * i, 200, 30)];
        
        if (i == 2 || i == 3)
        {
            t.secureTextEntry = YES;
        }
        
        t.borderStyle = UITextBorderStyleRoundedRect;
        t.placeholder = titleArr[i];
        t.tag = 10000 + i;
        t.delegate = self;
        t.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.view addSubview:t];
    }
    UITextField *t1 = (UITextField *)[self.view viewWithTag:10007];
    
    UIButton *bb = [UIButton buttonWithType:UIButtonTypeCustom];
    bb.frame = CGRectMake(10, t1.frame.origin.y + t1.frame.size.height + 20, self.view.frame.size.width - 20, 40);
    //    [bb setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    bb.backgroundColor = [[UIColor alloc] initWithRed:121 % 256 / 255.0 green:185 % 256 / 255.0 blue:26 % 256 / 255.0 alpha:1];;
    [bb setTitle:@"注册" forState:UIControlStateNormal];
    [bb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bb.layer.cornerRadius = 8;
    self.view.clipsToBounds = YES;
    [bb addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bb];
}

//loginBtn
-(void)loginBtn
{
    NSLog(@"注册");
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"注册";
    view.myLabel.frame = CGRectMake(138, 20, 50, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(10, 20, 50, 50)];
    [self.view addSubview:view];
}

//收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    for (int i = 0; i < 8; i++)
//    {
//        UITextField *t = (UITextField *)[self.view viewWithTag:10000 + i];
//        [t resignFirstResponder];
//    }
    [self.view endEditing:YES];
}

//#pragma mark - UITextFieldDelegate
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    UITextField *t = (UITextField *)[self.view viewWithTag:10004];
//    if (textField == t)
//    {
//        [UIView animateWithDuration:.3 animations:^{
//            t.frame = CGRectMake(t.frame.origin.x, t.frame.origin.y - 50, 200, 30);
//        }];
//    }
//    return YES;
//}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    return YES;
}

//click 返回
-(void)click
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
