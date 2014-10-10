//
//  KeepViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-22.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//
#define kPAGE 5

#import "KeepViewController.h"
#import "ZDViewController.h"
#import "TitleView.h"
#import "CustomCell.h"
#import "Cell1.h"
@interface KeepViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *_s;
    UIScrollView *_sc;
    UIScrollView *_scrollView;
    UIScrollView *_s1;
    CGRect _oldFrame;
    UIView *_v;
    
    UIButton *_b1;
    UIButton *_b2;
    UIButton *_currentBtn;
    UIPageControl *_page;
    NSMutableArray *_imgArr;
    CGFloat _oldSize;
}
@end

@implementation KeepViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    _imgArr = [NSMutableArray array];
    for (int i = 0; i < 5; i++)
    {
        [_imgArr addObject:self.img];
    }
    [self createTitleView];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = self.title;
    view.myLabel.frame = CGRectMake(120, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
    
    _s = [[UIScrollView alloc] initWithFrame:CGRectMake(0, view.frame.origin.y + view.frame.size.height, self.view.bounds.size.width, 150)];
    _s.contentSize = CGSizeMake(self.view.bounds.size.width * (_imgArr.count + 2), 150);
    _s.contentOffset = CGPointMake(0, 0);
    [_s scrollRectToVisible:CGRectMake(self.view.bounds.size.width,0,self.view.bounds.size.width,150) animated:NO];
    _s.pagingEnabled = YES;
    _s.delegate = self;
    for (int i = 0; i < _imgArr.count; i++)
    {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * (i + 1), 0, _s.frame.size.width, 150)];
        
        img.contentMode = UIViewContentModeScaleToFill;
        img.image = [UIImage imageNamed:_imgArr[i]];
        [_s addSubview:img];
    }
    [self.view addSubview:_s];
    
    //添加头图片
    UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    headImg.image = [UIImage imageNamed:_imgArr[_imgArr.count - 1]];
    [_s addSubview:headImg];
    //添加尾图片
    UIImageView *footImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * (_imgArr.count + 1), 0, self.view.bounds.size.width, 150)];
    footImg.image = [UIImage imageNamed:_imgArr[0]];
    [_s addSubview:footImg];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, _s.frame.origin.y + _s.frame.size.height, self.view.bounds.size.width, 30)];
    v.backgroundColor = [[UIColor alloc] initWithRed:121 % 256 / 255.0 green:185 % 256 / 255.0 blue:26 % 256 / 255.0 alpha:1];
    [self.view addSubview:v];
    
    _v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 5)];
    _v.backgroundColor = [UIColor yellowColor];
    _oldFrame = _v.frame;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 25, 160, 5)];
    _scrollView.clipsToBounds = NO;
    _scrollView.contentSize = CGSizeMake(160 * 2, 5);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    [_scrollView addSubview:_v];
    [v addSubview:_scrollView];
    [self.view addSubview:v];
    
    _b1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_b1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _b1.frame = CGRectMake(0, 0, 160, 30);
    _b1.titleLabel.font = [UIFont systemFontOfSize:14];
    [_b1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    _b1.tag = 1000;
    _currentBtn = _b1;
    [v addSubview:_b1];
    
    _b2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _b2.titleLabel.font = [UIFont systemFontOfSize:14];
    [_b2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _b2.frame = CGRectMake(160, 0, 160, 30);
    
    [_b2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    _b2.tag = 1001;
    [v addSubview:_b2];
    
    if ([self.title isEqualToString:@"养生推荐"])
    {
        [_b1 setTitle:@"按时节" forState:UIControlStateNormal];
        [_b2 setTitle:@"按材料" forState:UIControlStateNormal];
    }
    else if ([self.title isEqualToString:@"健身推荐"])
    {
        [_b1 setTitle:@"男士推荐" forState:UIControlStateNormal];
        [_b2 setTitle:@"女士推荐" forState:UIControlStateNormal];
    }
    else if ([self.title isEqualToString:@"纤体推荐"])
    {
        [_b1 setTitle:@"产后恢复类" forState:UIControlStateNormal];
        [_b2 setTitle:@"完美塑身类" forState:UIControlStateNormal];
    }
    else if ([self.title isEqualToString:@"女生推荐"])
    {
        [_b1 setTitle:@"饮食搭配" forState:UIControlStateNormal];
        [_b2 setTitle:@"经期保护" forState:UIControlStateNormal];
    }
    else if ([self.title isEqualToString:@"宝宝推荐"])
    {
        [_b1 setTitle:@"0 - 5 岁" forState:UIControlStateNormal];
        [_b2 setTitle:@"6 - 10 岁" forState:UIControlStateNormal];
    }
    
    _sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, v.frame.origin.y + v.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - v.frame.origin.y - v.frame.size.height)];
    _sc.pagingEnabled = YES;
    _sc.bounces = NO;
    _sc.delegate = self;
    _sc.contentSize = CGSizeMake(320 * 2, self.view.bounds.size.height - v.frame.origin.y - v.frame.size.height);
    [self.view addSubview:_sc];
    
    for (int i = 0; i < 2; i++)
    {
        UITableView *tab = [[UITableView alloc] initWithFrame:CGRectMake(320 * i, 0, self.view.bounds.size.width, self.view.bounds.size.height - v.frame.origin.y - v.frame.size.height) style:UITableViewStylePlain];
        tab.delegate = self;
        tab.dataSource = self;
        tab.tag = 100 + i;
        [tab registerNib:[UINib nibWithNibName:@"Cell1" bundle:nil] forCellReuseIdentifier:@"Cell1"];
        [_sc addSubview:tab];
    }
    //page控制器
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(_s.frame.origin.x, _s.frame.origin.y + _s.frame.size.height - 15, 100, 10)];
    _page.numberOfPages = _imgArr.count;
    [_page addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    _page.currentPage = 0;
    [self.view addSubview:_page];
    
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changePage) userInfo:nil repeats:YES];
}

-(void)turnPage
{
    int page = _page.currentPage;
    [_s scrollRectToVisible:CGRectMake(self.view.bounds.size.width * (page + 1), 0, self.view.bounds.size.width, 150) animated:NO];
}

//定时器方法
-(void)changePage
{
    int page = _page.currentPage;
    page++;
    page = page > (_imgArr.count - 1) ? 0 : page;
    _page.currentPage = page;
    [self turnPage];
}

-(void)click:(UIButton *)b
{
    switch (b.tag)
    {
        case 1000:
        {
            if (_currentBtn != nil)
            {
                [_currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            [UIView animateWithDuration:.3 animations:^{
                _sc.contentOffset = CGPointMake(0, 0);
                UIButton *b = (UIButton *)[self.view viewWithTag:1000];
                [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                _currentBtn = b;
            }];
        }
            break;
        case 1001:
        {
            if (_currentBtn != nil)
            {
                [_currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            [UIView animateWithDuration:.3 animations:^{
                _sc.contentOffset = CGPointMake(320, 0);
                UIButton *b = (UIButton *)[self.view viewWithTag:1001];
                [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                _currentBtn = b;
            }];
        }
        default:
            break;
    }
}

//click
-(void)click
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - scrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _sc)
    {
        if (_currentBtn != nil)
        {
            [_currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        int current = _sc.contentOffset.x / 320;
        [UIView animateWithDuration:.3 animations:^{
            UIButton *b = (UIButton *)[self.view viewWithTag:1000 + current];
            [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            _currentBtn = b;
        }];
    }
    
    else if(scrollView == _s)
    {
        int current1 = (_s.contentOffset.x - self.view.bounds.size.width) / self.view.bounds.size.width + 1;
        
        if (current1 == 0)
        {
            [_s scrollRectToVisible:CGRectMake(self.view.bounds.size.width * _imgArr.count, 0, self.view.bounds.size.width, 150) animated:NO];
        }
        else if (current1 == _imgArr.count + 1)
        {
            [_s scrollRectToVisible:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, 150) animated:NO];
        }
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _sc) {
        NSArray * arr = @[_scrollView, _sc];
        for (UIScrollView * s in arr) {
            if (s != scrollView)
            {
                CGPoint p = scrollView.contentOffset;
                p.x = -p.x / 320 * _scrollView.frame.size.width;
                _oldSize = p.x;
                s.contentOffset = p;
            }
        }
    }
    else if(scrollView == _scrollView)
    {
        _scrollView.contentOffset = CGPointMake(_oldSize, 0);
    }
    else if (scrollView == _s)
    {
        int page = (_s.contentOffset.x - self.view.bounds.size.width) / self.view.bounds.size.width + 1;
        page--;
        _page.currentPage = page;
    }
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDViewController *zd = [[ZDViewController alloc] init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:zd animated:YES];
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
