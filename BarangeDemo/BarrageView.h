//
//  BarrageView.h
//  BarangeDemo
//
//  Created by sy on 16/7/27.
//  Copyright © 2016年 sy. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BasicView.h"

typedef void(^completeBlock)(BOOL finished);

@interface BarrageView : BasicView

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *tagImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, copy) NSDictionary *modelDictionary;
@property (nonatomic,assign) CGRect originFrame; // 记录原始坐标
@property (nonatomic,assign,getter=isFinished) BOOL finished;

- (void)animateWithCompleteBlock:(completeBlock)completed;

@end
