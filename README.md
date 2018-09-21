# UICollectionViewCell 根据内容自动适应宽度
1.设置layout.estimatedItemSize
2.在自定义cell中实现preferredLayoutAttributesFittingAttributes
```
#pragma mark — 实现自适应文字宽度的关键步骤:item的layoutAttributes
-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{

    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    //    CGRect maxBounds= CGRectMake(0, 0, CGFLOAT_MAX, self.textLabel.frame.size.height);
    //    attributes.frame = [self.textLabel textRectForBounds:maxBounds limitedToNumberOfLines:self.textLabel.numberOfLines];
    attributes.frame = [self.textLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.textLabel.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.textLabel.font} context:nil];
    return attributes;
}
```
