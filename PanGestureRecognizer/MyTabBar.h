//
//  MyTabBar.h
//  PanGestureRecognizer
//
//  Created by LI on 16/7/19.
//  Copyright © 2016年 LI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBar;
@protocol MyTabBarDelegate <NSObject>

@optional
- (void)tabbar:(MyTabBar *)tabbar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface MyTabBar : UIView

/** 滑动代理 */
@property (weak, nonatomic) id<MyTabBarDelegate> delegate;

/** 当前索引值 */
@property (assign, nonatomic) NSUInteger selectedIndex;


/** 对外部流出接口创建 UITabbarButton */
- (void)createTabbarButtonTitle:(NSString *)title imageNormalName:(NSString *)normalName imageSelectedName:(NSString *)selName;

@end
