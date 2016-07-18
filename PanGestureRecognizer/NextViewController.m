//
//  NextViewController.m
//  PanGestureRecognizer
//
//  Created by LI on 16/3/23.
//  Copyright © 2016年 LI. All rights reserved.
//

#import "NextViewController.h"
#import "TheNextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createBarButtonItem];
}

#pragma mark - 创建UIBarButtonItem
- (void)createBarButtonItem{
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

- (void)itemClick:(UIBarButtonItem *)barButtonItem{
    
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    TheNextViewController * next = [[TheNextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

@end
