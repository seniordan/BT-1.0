//
//  LogiViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//
#define kColor [[UIColor alloc] initWithRed:200 % 256 / 255.0 green:200 % 256 / 255.0 blue:200 % 256 / 255.0 alpha:1]

#import "LogiViewController.h"
#import "RegisteredViewController.h"
#import "MeViewController.h"
#import "TitleView.h"
#import "POP.h"
#define HAS_LOGIN (@"has_login")
@interface LogiViewController ()<UITextFieldDelegate>
{
    UITextField *_userName;
    UITextField *_passWord;
    UITextField *_code;
    UIView *_view;
    UIView *_v;
    CGRect _rect;
}
@end

@implementation LogiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    if ([self.isYES isEqualToString:@"YES"])
//    {
//        MeViewController *me = [[MeViewController alloc] init];
//        [self presentViewController:me animated:NO completion:nil];
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor alloc] initWithRed:245 % 256 / 255.0 green:245 % 256 / 255.0 blue:255 % 256 / 255.0 alpha:1];
    [self createTitleView];
    [self createView];
    _view = [[UIView alloc] initWithFrame:self.view.bounds];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = @"登录";
    view.myLabel.frame = CGRectMake(138, 20, 50, 50);
    view.imgView.hidden = YES;
    view.placeBtn.hidden = YES;
    //    [view setButton:view.searchBtn andTitle:@"注册" withRect:CGRectMake(270, 20, 50, 50)];
    [self.view addSubview:view];
}

//click
-(void)click
{
    NSLog(@"click");
}

//createView
-(void)createView
{
    _v = [[UIView alloc] initWithFrame:CGRectMake(0, KTitleHeight + 15, self.view.frame.size.width, 80)];
    _v.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_v];
    _rect = _v.frame;
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 25, 25)];
    img1.image = [UIImage imageNamed:@"activity_login_account"];
    [_v addSubview:img1];
    
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(img1.frame.origin.x, img1.frame.origin.y + img1.frame.size.height + 13, 25, 25)];
    img2.image = [UIImage imageNamed:@"activity_login_password"];
    [_v addSubview:img2];
    
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(img1.frame.origin.x + img1.frame.size.width + 10, img1.frame.origin.y + 3, 270, 20)];
    _userName.placeholder = @"用户名/邮箱";
    _userName.delegate = self;
    _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_v addSubview:_userName];
    
    _passWord = [[UITextField alloc] initWithFrame:CGRectMake(img2.frame.origin.x + img2.frame.size.width + 10, img2.frame.origin.y + 3, 270, 20)];
    _passWord.placeholder = @"密码";
    _passWord.delegate = self;
    _passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passWord.secureTextEntry = YES;
    [_v addSubview:_passWord];
    
    //tap事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
    [self.view addGestureRecognizer:tap];
    
    //高度为1的线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _v.frame.origin.y, self.view.frame.size.width, 1)];
    lineView.backgroundColor = kColor;
    [self.view addSubview:lineView];
    
    //中间
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(50, _v.frame.origin.y + _v.frame.size.height / 2, self.view.frame.size.width - 50, 1)];
    lineView2.backgroundColor = kColor;
    [self.view addSubview:lineView2];
    
    //底部
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, _v.frame.origin.y + _v.frame.size.height, self.view.frame.size.width, 1)];
    lineView1.backgroundColor = kColor;
    [self.view addSubview:lineView1];
    
    //登陆按钮
    //    UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(0, _v.frame.origin.y + _v.frame.size.height + 20, self.view.frame.size.width, 40)];
    //    vv.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:vv];
    
    UIButton *bb = [UIButton buttonWithType:UIButtonTypeCustom];
    bb.frame = CGRectMake(10, _v.frame.origin.y + _v.frame.size.height + 50, self.view.frame.size.width - 20, 40);
    //    [bb setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    bb.backgroundColor = [[UIColor alloc] initWithRed:121 % 256 / 255.0 green:185 % 256 / 255.0 blue:26 % 256 / 255.0 alpha:1];;
    [bb setTitle:@"登录" forState:UIControlStateNormal];
    [bb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bb.layer.cornerRadius = 8;
    self.view.clipsToBounds = YES;
    //    [bb setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 280)];
    //    [bb setTitleEdgeInsets:UIEdgeInsetsMake(5, -280, 5, 0)];
    [bb addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bb];
    
    //1 线
    //    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, vv.frame.origin.y, self.view.frame.size.width, 1)];
    //    v.backgroundColor = kColor;
    //    [self.view addSubview:v];
    //
    //    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, vv.frame.origin.y + vv.frame.size.height, self.view.frame.size.width, 1)];
    //    v1.backgroundColor = kColor;
    //    [self.view addSubview:v1];
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    b1.frame = CGRectMake(self.view.frame.size.width - 100, bb.frame.origin.y + bb.frame.size.height + 20, 80, 20);
    [b1 setTitle:@"游客登录" forState:UIControlStateNormal];
    [b1 setTitleColor:kColor forState:UIControlStateNormal];
    [self.view addSubview:b1];
    
    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    b2.frame = CGRectMake(20, b1.frame.origin.y, 80, 20);
    [b2 setTitle:@"用户注册" forState:UIControlStateNormal];
    [b2 setTitleColor:kColor forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(registeredClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b2];

}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _userName)
    {
        [_userName resignFirstResponder];
    }
    else
    {
        [_passWord resignFirstResponder];
    }
    return YES;
}


#pragma mark - tapView
-(void)tapView
{
    [_passWord resignFirstResponder];
    [_userName resignFirstResponder];
    [_code resignFirstResponder];
}

//注册
-(void)registeredClick
{
    RegisteredViewController *regi = [[RegisteredViewController alloc] init];
    [self presentViewController:regi animated:YES completion:nil];
}

//登录
-(void)loginBtn
{
    _v.frame = _rect;
    if ([_userName.text isEqualToString:@"123"] &&[_passWord.text isEqualToString:@"123"])
    {
        //        MessageViewControl *message = [[MessageViewControl alloc]init];
        //        [self.navigationController pushViewController:message animated:YES];
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:HAS_LOGIN];
        [self dismissViewControllerAnimated:YES completion:nil];
    }

    if(![_userName.text isEqualToString:@"123"])
    {
        POPSpringAnimation *springAnimation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        springAnimation2.fromValue = [NSValue valueWithCGPoint:CGPointMake(_v.center.x-20, _v.center.y)];
        springAnimation2.toValue = [NSValue valueWithCGPoint:_v.center];
        springAnimation2.springBounciness = 20;
        springAnimation2.springSpeed = 20;
        [springAnimation2 setCompletionBlock:^(POPAnimation *animation, BOOL done) {
            
            //            _usernameField.backgroundColor = [UIColor orangeColor];
            if (done) {
                _view.userInteractionEnabled = YES;
            }
        }];
        [_v pop_addAnimation:springAnimation2 forKey:@"changeposition"];
    }
    if(![_passWord.text isEqualToString:@"123"])
    {
        POPSpringAnimation *springAnimation1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        springAnimation1.fromValue = [NSValue valueWithCGPoint:CGPointMake(_v.center.x-20, _v.center.y)];
        springAnimation1.toValue = [NSValue valueWithCGPoint:_v.center];
        springAnimation1.springBounciness = 20;
        springAnimation1.springSpeed = 20;
        [springAnimation1 setCompletionBlock:^(POPAnimation *animation, BOOL done)
         {
             if (done) {
                 _view.userInteractionEnabled = YES;
             }
         }];
        [_v pop_addAnimation:springAnimation1 forKey:@"changeposition"];
    }
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
