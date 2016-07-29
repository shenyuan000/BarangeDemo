//
//  UIView+ViewFrame.m
//  Bank94Pro
//
//  Created by Tongling on 15/7/27.
//  Copyright (c) 2015年 &#32479;&#39046;&#24471;&#19968;&#32593;&#32476;&#31185;&#25216;&#65288;&#19978;&#28023;&#65289;&#26377;&#38480;&#20844;&#21496;. All rights reserved.
//

#import "UIView+ViewFrame.h"

@implementation UIView (ViewFrame)

-(CGFloat)frameHeight{
    return self.frame.size.height;
}

-(CGFloat)frameWidth{
    return self.frame.size.width;
}

- (CGFloat)midFrameHeigh{
    return self.frame.size.height/2.0f;
}

- (CGFloat)midFrameWidth{
    return self.frame.size.width/2.0f;
}


- (CGFloat)frameX{
    return self.frame.origin.x;
}

- (CGFloat)frameY{
    return self.frame.origin.y;
}

- (CGFloat)midFrameX{
    return self.frame.origin.x/2.0f;
}

- (CGFloat)midFrameY{
    return self.frame.origin.y/2.0f;
}

- (CGFloat)fullMarginY{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)fullMarginX{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setFrameX:(CGFloat)x{
    self.frame = CGRectMake(x, self.frameY, self.frameWidth, self.frameHeight);
}

- (void)setFrameY:(CGFloat)y{
    self.frame = CGRectMake(self.frameX, y, self.frameWidth, self.frameHeight);
}

- (void)setFrameWidth:(CGFloat)width{
    self.frame = CGRectMake(self.frameX, self.frameY, width, self.frameHeight);
}

- (void)setFrameHeight:(CGFloat)height{
    self.frame = CGRectMake(self.frameX, self.frameY, self.frameWidth, height);
}


@end
