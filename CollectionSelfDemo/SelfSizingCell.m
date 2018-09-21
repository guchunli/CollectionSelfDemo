//
//  SelfSizingCell.m
//  CollectionSelfDemo
//
//  Created by gcl on 2018/8/24.
//  Copyright © 2018年 gcl. All rights reserved.
//

#import "SelfSizingCell.h"

@implementation SelfSizingCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        self.autoresizingMask = YES;
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _textLabel.backgroundColor = [UIColor greenColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.numberOfLines = 1;
//        [_textLabel sizeToFit];
    }
    return _textLabel;
}

#pragma mark — 实现自适应文字宽度的关键步骤:item的layoutAttributes
-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{

    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
//    CGRect maxBounds= CGRectMake(0, 0, CGFLOAT_MAX, self.textLabel.frame.size.height);
//    attributes.frame = [self.textLabel textRectForBounds:maxBounds limitedToNumberOfLines:self.textLabel.numberOfLines];
    attributes.frame = [self.textLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.textLabel.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.textLabel.font} context:nil];
    self.textLabel.frame = attributes.frame;
    return attributes;
}

@end
