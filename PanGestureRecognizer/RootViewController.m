//
//  RootViewController.m
//  PanGestureRecognizer
//
//  Created by LI on 16/3/23.
//  Copyright © 2016年 LI. All rights reserved.
//

#import "RootViewController.h"
#import "CustomTabbarController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    //将rootViewController作为容器视图，WQFTabBarController作为子视图控制器
    CustomTabbarController *tabBarController = [[CustomTabbarController alloc] init];
    
//    tabBarController.view.backgroundColor = [UIColor cyanColor];
    
    //将tabBarController做为子视图控制器
    [self addChildViewController:tabBarController];
    
    //将子视图控制器显示到父视图上
    [self.view addSubview:tabBarController.view];
}


@end
