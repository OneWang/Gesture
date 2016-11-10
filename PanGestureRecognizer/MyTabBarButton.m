//
//  MyTabBarButton.m
//  PanGestureRecognizer
//
//  Created by LI on 16/7/19.
//  Copyright © 2016年 LI. All rights reserved.
//

#define Rate 0.5

#import "MyTabBarButton.h"

@implementation MyTabBarButton

- (instancetype)init
{
    if (self = [super init]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //        self.imageView.backgroundColor = [UIColor yellowColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        //        self.titleLabel.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = self.frame.size.height * 0.8;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat labelX = 0;
    CGFloat labelY = self.frame.size.height * Rate;
    CGFloat labelW = self.frame.size.width;
    CGFloat labelH = self.frame.size.height * (1 - Rate);
    
    return CGRectMake(labelX, labelY, labelW, labelH);
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
