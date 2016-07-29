//
//  BasicView.m
//  GuoGuoLiveDev
//
//  Created by 94bank on 16/4/28.
//  Copyright © 2016年 统领得一网络科技（上海）有限公司. All rights reserved.
//

#import "BasicView.h"
#define RainColor(x,y,z)   [UIColor colorWithRed:(x)/255.0 green:(y)/255.0 blue:(z)/255.0 alpha:1.0]
@implementation BasicView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildBackgroundColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildBackgroundColor];
    }
    return self;
}

- (void)buildBackgroundColor {
    self.backgroundColor = RainColor(241, 241, 241);
}

@end
