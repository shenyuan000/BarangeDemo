//
//  ViewController.m
//  BarangeDemo
//
//  Created by sy on 16/7/27.
//  Copyright © 2016年 sy. All rights reserved.
//

#import "ViewController.h"
#import "BarrageAnimoperation.h"

#define HeadImageKey @"headImage"
#define TagImageKey @"tagImage"
#define NameKey @"name"
#define MessageKey @"message"






@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *giftInfos; // 礼物模型数组
@property (nonatomic,strong) NSOperationQueue *queue1; // 全局动画队列1
@property (nonatomic,strong) NSOperationQueue *queue2; // 全局动画队列2
@property (nonatomic,assign) NSInteger rowCount; // 第几次触发
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1; // 队列分发
    _queue1 = queue1;
    
    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    queue2.maxConcurrentOperationCount = 1; // 队列分发
    _queue2 = queue2;
    
    _rowCount = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 模拟收到礼物消息的回调
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSInteger i = _rowCount % (self.giftInfos.count);
    //    for (int i = 0; i < self.giftInfos.count; i++) {
    @autoreleasepool {
        
//        NSLog(@"%@",[self.giftInfos[i] name]);
        
        BarrageAnimoperation *op = [[BarrageAnimoperation alloc] init]; // 初始化操作
        op.listView = self.view;
        
        if (i % 2) {
            op.model = self.giftInfos[i];
            op.index = i;
            [_queue1 addOperation:op];
        }else {
            op.index = i;
            op.model = self.giftInfos[i];
            [_queue2 addOperation:op];

        }
        
    }
    //    }
    _rowCount++;
    
}
- (NSMutableArray *)giftInfos {
    if (_giftInfos == nil) {
        _giftInfos = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *model1 = [[NSMutableDictionary alloc] init];
        [model1 setValue:@"code" forKey:HeadImageKey];
        [model1 setValue:@"code" forKey:TagImageKey];
        [model1 setValue:@"model1" forKey:NameKey];
        [model1 setValue:@"1111111111" forKey:MessageKey];
        
        NSMutableDictionary *model2 = [[NSMutableDictionary alloc] init];
        [model2 setValue:@"code" forKey:HeadImageKey];
        [model2 setValue:@"code" forKey:TagImageKey];
        [model2 setValue:@"model2" forKey:NameKey];
        [model2 setValue:@"2222222222222" forKey:MessageKey];
        
        NSMutableDictionary *model3 = [[NSMutableDictionary alloc] init];
        [model3 setValue:@"code" forKey:HeadImageKey];
        [model3 setValue:@"code" forKey:TagImageKey];
        [model3 setValue:@"model3" forKey:NameKey];
        [model3 setValue:@"333333333" forKey:MessageKey];
        
        
        NSMutableDictionary *model4 = [[NSMutableDictionary alloc] init];
        [model4 setValue:@"code" forKey:HeadImageKey];
        [model4 setValue:@"code" forKey:TagImageKey];
        [model4 setValue:@"model4" forKey:NameKey];
        [model4 setValue:@"4444444444444444444" forKey:MessageKey];
        
  
        
        [_giftInfos addObject:model1];
        [_giftInfos addObject:model2];
        [_giftInfos addObject:model3];
        [_giftInfos addObject:model4];
        
    }
    return _giftInfos;
}
@end
