//
//  CurveLineViewController.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-23.
//  Copyright (c) 2014年 ChipSea. All rights reserved.
//

#import "CurveLineViewController.h"
#import "TitleView.h"
#import "SHPlot.h"
#import "SHLineGraphView.h"
@interface CurveLineViewController ()

@end

@implementation CurveLineViewController

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
    self.navigationController.navigationBarHidden = YES;
    [self createTitleView];
    [self createLine];
}

//createLine
-(void)createLine
{
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, KTitleHeight + 10, self.view.bounds.size.width, 320)];
    sc.contentSize = CGSizeMake(568, 250);
    sc.showsHorizontalScrollIndicator = NO;
    sc.bounces = NO;
    [self.view addSubview:sc];
    
    SHLineGraphView *_lineGraph = [[SHLineGraphView alloc] initWithFrame:CGRectMake(0, 0, 568, 250)];
    
    NSDictionary *_themeAttributes = @{
                                       kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:15],
                                       kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:12],
                                       kYAxisLabelSideMarginsKey : @20,
                                       kPlotBackgroundLineColorKye : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4]
                                       };
    _lineGraph.themeAttributes = _themeAttributes;
    
    _lineGraph.yAxisRange = @(120);
    
    _lineGraph.yAxisSuffix = @"KG";
    
    _lineGraph.xAxisValues = @[
                               @{ @1 : @"9-1" },
                               @{ @2 : @"9-2" },
                               @{ @3 : @"9-3" },
                               @{ @4 : @"9-4" },
                               @{ @5 : @"9-5" },
                               @{ @6 : @"9-6" },
                               @{ @7 : @"9-7" },
                               @{ @8 : @"9-8" },
                               @{ @9 : @"9-9" },
                               @{ @10 : @"9-10" },
                               @{ @11 : @"9-11" },
                               @{ @12 : @"9-12" }
                               ];
    
    SHPlot *_plot1 = [[SHPlot alloc] init];
    _plot1.plottingValues = @[
                              @{ @1 : @80 },
                              @{ @2 : @20 },
                              @{ @3 : @23 },
                              @{ @4 : @22 },
                              @{ @5 : @12.3 },
                              @{ @6 : @45.8 },
                              @{ @7 : @56 },
                              @{ @8 : @97 },
                              @{ @9 : @65 },
                              @{ @10 : @10 },
                              @{ @11 : @67 },
                              @{ @12 : @23 }
                              ];

    NSArray *arr = @[@"80", @"20", @"23", @"22", @"12.3", @"45.8" , @"56" , @"97", @"65", @"10", @"67", @"23"];
    _plot1.plottingPointsLabels = arr;
    
    NSDictionary *_plotThemeAttributes = @{
                                           kPlotFillColorKey : [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5],
                                           kPlotStrokeWidthKey : @2,
                                           kPlotStrokeColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                           kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                           kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:20]
                                           };
    
    _plot1.plotThemeAttributes = _plotThemeAttributes;
    [_lineGraph addPlot:_plot1];
    
    [_lineGraph setupTheView];
    
    [sc addSubview:_lineGraph];
}

//createTitleView
-(void)createTitleView
{
    self.navigationController.navigationBarHidden = YES;
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KTitleHeight)];
    //    [view.placeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view.searchBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    view.myLabel.text = self.title;
    view.myLabel.frame = CGRectMake(135, 20, 100, 50);
    view.placeBtn.hidden = YES;
    [view setButton:view.searchBtn andTitle:@"返回" withRect:CGRectMake(-10, 20, 80, 50)];
    [self.view addSubview:view];
}

//click
-(void)click
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    //看下面的，自己可以调整，以达到你想要的效果，比如只能横屏显示，只能竖屏显示，或者直接返回YES,表示可以支持任何方向的旋转.
//    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
//}

//- (BOOL)shouldAutorotate
//{
//	return YES;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//	return UIInterfaceOrientationLandscapeLeft;
//}
//
//- (NSUInteger)supportedInterfaceOrientations
//{
//	return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//}

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
