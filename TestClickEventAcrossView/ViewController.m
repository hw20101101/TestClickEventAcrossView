//
//  ViewController.m
//  TestClickEventAcrossView
//
//  Created by 快摇002 on 2018/10/23.
//  Copyright © 2018 aiitec. All rights reserved.
//

#import "ViewController.h"
#import "FirstView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //底层视图(需要触发点击事件)
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(100, 40, 100, 100)];
    firstView.backgroundColor = [UIColor yellowColor];
    firstView.userInteractionEnabled = YES;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClick)];
    [firstView addGestureRecognizer:tap];
    [self.view addSubview:firstView];

    //中间的透明视图
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(150, 50, 100, 100)];
    secondView.alpha = 0;
    [self.view addSubview:secondView];

    //最上面的透明视图
    FirstView *customView = [[FirstView alloc] initWithFrame:CGRectMake(80, 10, 300, 200)];
    customView.alpha = 0;
    customView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:.5];
    customView.passthroughViews = @[firstView, secondView];
    [self.view addSubview:customView];
}

- (void)onClick{
    NSLog(@"-->> onClick");
}

@end
