//
//  BarrageAnimoperation.m
//  BarangeDemo
//
//  Created by sy on 16/7/27.
//  Copyright © 2016年 sy. All rights reserved.
//

#import "BarrageAnimoperation.h"


#define KScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface BarrageAnimoperation ()
@property (nonatomic, getter = isFinished)  BOOL finished;
@property (nonatomic, getter = isExecuting) BOOL executing;
@end


@implementation BarrageAnimoperation

@synthesize finished = _finished;
@synthesize executing = _executing;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _executing = NO;
        _finished  = NO;
        
        
    }
    return self;
}

- (void)start {
    
    if ([self isCancelled]) {
        self.finished = YES;
        return;
    }
    self.executing = YES;
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        _presentView = [[BarrageView alloc] init];
        _presentView.modelDictionary = _model;
        _presentView.backgroundColor = [UIColor clearColor];
        
        // i ％ 2 控制最多允许出现几行
        if (_index % 2) {
            _presentView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width + self.listView.frame.size.width / 2, 300, self.listView.frame.size.width / 2, 40);
        }else {
            _presentView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width + self.listView.frame.size.width / 2, 230, self.listView.frame.size.width / 2, 40);
        }
        
        _presentView.originFrame = _presentView.frame;
        [self.listView addSubview:_presentView];
        
        [self.presentView animateWithCompleteBlock:^(BOOL finished) {
            self.finished = finished;
        }];
        
    }];
    
}

#pragma mark -  手动触发 KVO
- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}


@end
