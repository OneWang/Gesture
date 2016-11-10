//
//  MyTabBar.m
//  PanGestureRecognizer
//
//  Created by LI on 16/7/19.
//  Copyright © 2016年 LI. All rights reserved.
//

#import "MyTabBar.h"
#import "MyTabBarButton.h"

@interface MyTabBar ()

@property (nonatomic,strong) UIButton * selectedButton;

@end

@implementation MyTabBar

- (void)createTabbarButtonTitle:(NSString *)title imageNormalName:(NSString *)normalName imageSelectedName:(NSString *)selName
{
    MyTabBarButton * button = [[MyTabBarButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        MyTabBarButton * button = self.subviews[i];
        button.tag = i;
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / count;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonH = self.frame.size.height;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        if (i == 0) {
            [self buttonClick:button];
        }
    }
}

/**
 *  按钮的点击事件
 */
- (void)buttonClick:(MyTabBarButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectButtonFrom:to:)]) {
        [self.delegate tabbar:self didSelectButtonFrom:self.selectedButton.tag to:btn.tag];
    }
    
    self.selectedButton.selected = NO;
    
    btn.selected = YES;
    
    self.selectedButton = btn;
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    MyTabBarButton * button = self.subviews[selectedIndex];
    [self buttonClick:button];
}


@end
