//
//  CollectionReusableView.m
//  CollectionSelfDemo
//
//  Created by gcl on 2018/8/24.
//  Copyright © 2018年 gcl. All rights reserved.
//

#import "CollectionReusableView.h"

@implementation CollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.titleLabel];
    }
    return self;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
