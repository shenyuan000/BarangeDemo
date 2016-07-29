//
//  BarrageAnimoperation.h
//  BarangeDemo
//
//  Created by sy on 16/7/27.
//  Copyright © 2016年 sy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarrageView.h"

@interface BarrageAnimoperation : NSOperation
@property (nonatomic,strong) BarrageView *presentView;
@property (nonatomic,strong) UIView *listView;
@property (nonatomic,copy)  NSDictionary *model;
@property (nonatomic,assign) NSInteger index;
@end
