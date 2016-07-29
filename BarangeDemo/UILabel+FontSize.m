//
//  UILabel+FontSize.m
//  IntelligentWallet
//
//  Created by Hanker on 16/1/11.
//  Copyright © 2016年 HongZheJinRong. All rights reserved.
//

#import "UILabel+FontSize.h"

@implementation UILabel (FontSize)
- (void)fontSizeAdd:(CGFloat)size{
    self.font = [UIFont systemFontOfSize:self.font.pointSize + size];
}

- (void)fontSize:(CGFloat)size{
    self.font = [UIFont systemFontOfSize:size];
}
@end
