//
//  UIView+ViewFrame.h
//  Bank94Pro
//
//  Created by Tongling on 15/7/27.
//  Copyright (c) 2015年 &#32479;&#39046;&#24471;&#19968;&#32593;&#32476;&#31185;&#25216;&#65288;&#19978;&#28023;&#65289;&#26377;&#38480;&#20844;&#21496;. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewFrame)

- (CGFloat)frameHeight;
- (CGFloat)frameWidth;
- (CGFloat)midFrameHeigh;
- (CGFloat)midFrameWidth;

- (void)setFrameX:(CGFloat)x;
- (void)setFrameY:(CGFloat)y;
- (void)setFrameWidth:(CGFloat)width;
- (void)setFrameHeight:(CGFloat)height;

- (CGFloat)frameX;
- (CGFloat)frameY;
- (CGFloat)midFrameX;
- (CGFloat)midFrameY;

- (CGFloat)fullMarginY;
- (CGFloat)fullMarginX;
@end
