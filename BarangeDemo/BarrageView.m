//
//  BarrageView.m
//  BarangeDemo
//
//  Created by sy on 16/7/27.
//  Copyright © 2016年 sy. All rights reserved.
//

#import "BarrageView.h"
#import "NSString+Frame.h"
#import "UILabel+FontSize.h"
#import "UILabel+StringFrame.h"

#define RainColor(x,y,z)   [UIColor colorWithRed:(x)/255.0 green:(y)/255.0 blue:(z)/255.0 alpha:1.0]
#define space 5

#define ViewHeight 30
#define TagHeight  14
#define NameLabelHeight 14
#define NameLabelFont 12
#define NameLabelColor RainColor(242,206,62)

#define MessageLabelHeight 14
#define MessageLabelFont 12
#define MessageLabelColor RainColor(255,255,255)

@interface BarrageView ()
@property (nonatomic,copy) void(^completeBlock)(BOOL finished);

@end

@implementation BarrageView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{
    //_headImageView
    _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ViewHeight, ViewHeight)];
    [self addSubview:_headImageView];
    //把headView变成圆角
    _headImageView.layer.cornerRadius = ViewHeight/2;
    _headImageView.clipsToBounds = YES;
    _headImageView.layer.borderWidth = 2;
    _headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    //_tagImageView

    _tagImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ViewHeight-TagHeight , ViewHeight-TagHeight, TagHeight, TagHeight)];
    [self addSubview:_tagImageView];
    //把_tagImageView变成圆角
    _tagImageView.layer.cornerRadius = TagHeight/2;
    _tagImageView.layer.masksToBounds = YES;
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImageView.frame)+space+space, 0, 50, NameLabelHeight)];
    [_nameLabel fontSize:NameLabelFont];
    _nameLabel.textColor = NameLabelColor;
    [self addSubview:_nameLabel];
    
    
    _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame), 50, MessageLabelHeight)];
    _messageLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    [_messageLabel fontSize:MessageLabelFont];
    _messageLabel.textColor = MessageLabelColor;
    [self addSubview:_messageLabel];
    
    
}

- (void)setModelDictionary:(NSDictionary *)modelDictionary{
    CGFloat maxWeight = 0.0;
    //加入的时候做非空判断
//    if (modelDictionary[@"headImage"]) {
//        _headImageView.image = modelDictionary[@"headImage"];
//    }
//    
//    [_tagImageView removeFromSuperview];
//    if (modelDictionary[@"tagImage"]) {
//        _tagImageView.image = modelDictionary[@"tagImage"];
//    }
    if (modelDictionary[@"name"]) {
        //计算label的宽度，并且显示字体
        NSString *nameString = [modelDictionary[@"name"] copy];
        CGSize size1 = [nameString sizeWithFont:[UIFont systemFontOfSize:NameLabelFont]];
        maxWeight = size1.width;
        _nameLabel.frame = CGRectMake(CGRectGetMaxX(_headImageView.frame)+space+space, 0,size1.width+space, NameLabelHeight);
        _nameLabel.text = nameString;
        
        
    }
    if (modelDictionary[@"message"]) {
        //计算label的宽度，并且显示字体
        NSString *messageString = [modelDictionary[@"message"] copy];
        CGSize size2 = [messageString sizeWithFont:[UIFont systemFontOfSize:MessageLabelFont]];
        if (size2.width > maxWeight) {
            maxWeight = size2.width;
        }
        _messageLabel.frame = CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame), size2.width+space, MessageLabelHeight);
        _messageLabel.text = messageString;
    }
   
    
}

- (void)animateWithCompleteBlock:(completeBlock)completed{
    
    [UIView animateWithDuration:6 animations:^{
        self.frame = CGRectMake( -self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
     
        [self reset];
        _finished = finished;
        self.completeBlock(finished);
        [self removeFromSuperview];
    }];
    self.completeBlock = completed;
}
// 重置
- (void)reset {
    
    self.frame = _originFrame;
    self.alpha = 1;
}
@end
