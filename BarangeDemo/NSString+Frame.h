//
//  NSString+Frame.h
//  GuoGuoLiveDev
//
//  Created by sy on 16/5/17.
//  Copyright © 2016年 统领得一网络科技（上海）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Frame)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;
@end
