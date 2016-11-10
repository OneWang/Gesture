//
//  CustomTabbarController.m
//  PanGestureRecognizer
//
//  Created by LI on 16/3/23.
//  Copyright © 2016年 LI. All rights reserved.
//

#import "CustomTabbarController.h"
#import "CustomNavigationController.h"

#import "HomeViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"

#import "MyTabBar.h"

@interface CustomTabbarController ()<MyTabBarDelegate>
//自定义 tabbar
@property (nonatomic,strong) MyTabBar * myTabbar;
@end

@implementation CustomTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建子视图控制器
    [self createSubviewControllers];
    //创建自定义 TabBar
    [self createMyTabBar];
    

    [self.myTabbar createTabbarButtonTitle:@"首页" imageNormalName:@"home" imageSelectedName:@"home_on"];
    [self.myTabbar createTabbarButtonTitle:@"购票" imageNormalName:@"payticket" imageSelectedName:@"payticket_on"];
    [self.myTabbar createTabbarButtonTitle:@"商城" imageNormalName:@"store" imageSelectedName:@"store_on"];
    [self.myTabbar createTabbarButtonTitle:@"发现" imageNormalName:@"discover" imageSelectedName:@"discover_on"];
    
    CustomNavigationController *customNav = self.viewControllers[self.selectedIndex];
    
    
    //拖拽手势
    UIPanGestureRecognizer * recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragging:)];
    
    [[customNav.viewControllers lastObject].view addGestureRecognizer:recognizer];
}

/**
 *  添加自定义 tabbar
 */
- (void)createMyTabBar{
    
    MyTabBar *tabbar = [[MyTabBar alloc] init];
    tabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabbar];
    tabbar.delegate = self;
    tabbar.backgroundColor = [UIColor whiteColor];
    self.myTabbar = tabbar;
    
}

#pragma mark - 创建UITabbarController的子视图控制器
- (void)createSubviewControllers{
    
    HomeViewController * home = [[HomeViewController alloc] init];
    CustomNavigationController * nav1 = [[CustomNavigationController alloc] initWithRootViewController:home];
//    UITabBarItem * item1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
//    nav1.tabBarItem = item1;
    home.view.backgroundColor = [UIColor whiteColor];
    home.title = @"第1页";
    
    SecondViewController * second = [[SecondViewController alloc] init];
    CustomNavigationController * nav2 = [[CustomNavigationController alloc] initWithRootViewController:second];
//    UITabBarItem * item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:2];
//    nav2.tabBarItem = item2;
    second.view.backgroundColor = [UIColor yellowColor];
    second.title = @"第2页";
    
    ThirdViewController * third = [[ThirdViewController alloc] init];
    CustomNavigationController * nav3 = [[CustomNavigationController alloc] initWithRootViewController:third];
//    UITabBarItem * item3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3];
//    nav3.tabBarItem = item3;
    third.view.backgroundColor = [UIColor purpleColor];
    third.title = @"第3页";
    
    FourViewController * four = [[FourViewController alloc] init];
    CustomNavigationController * nav4 = [[CustomNavigationController alloc] initWithRootViewController:four];
//    UITabBarItem * item4 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:4];
//    nav4.tabBarItem = item4;
    four.view.backgroundColor = [UIColor cyanColor];
    four.title = @"第4页";
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
}

- (void)dragging:(UIPanGestureRecognizer *)recognizer{
    
    CustomNavigationController * customNav = self.viewControllers[self.selectedIndex];
    
    //在x方向上的移动距离
    CGFloat tx = [recognizer translationInView:[customNav.viewControllers lastObject].view].x;

    CGFloat x = [customNav.viewControllers lastObject].view.frame.origin.x;

    NSLog(@"%f==%f==%f",x,tx,self.view.frame.size.width * 0.5);
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        
        if (ABS(x) > self.view.frame.size.width * 0.5) {
            [UIView animateWithDuration:.25 animations:^{

                [customNav.viewControllers lastObject].view.transform = CGAffineTransformMakeTranslation(-self.view.frame.size.width, 0);
                MyTabBar *myTabBar = nil;
                for (UIView *view in self.tabBar.subviews) {
                    if ([view isKindOfClass:[MyTabBar class]]) {
                        myTabBar = (MyTabBar *)view;
                    }
                }
                myTabBar.selectedIndex = 1;
                
            } completion:^(BOOL finished) {
//                [customNav.viewControllers lastObject].view.transform = CGAffineTransformIdentity;
            }];
        }else {
            [UIView animateWithDuration:0.25 animations:^{
//                [customNav.viewControllers lastObject].view.transform = CGAffineTransformIdentity;
            }];
        }
    }else{
        // 移动view
        [customNav.viewControllers lastObject].view.transform = CGAffineTransformMakeTranslation(tx, 0);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
    
}
//实现代理方法实现跳转
- (void)tabbar:(MyTabBar *)tabbar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
