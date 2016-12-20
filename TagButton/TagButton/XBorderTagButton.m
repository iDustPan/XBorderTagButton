//
//  XBorderTagButton.m
//  TagButton
//
//  Created by 徐攀 on 2016/12/20.
//  Copyright © 2016年 com.borderXLab. All rights reserved.
//

#import "XBorderTagButton.h"

@interface XBorderTagButton ()

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, assign) CGFloat imageWidth;
@property (nonatomic, assign) CGFloat imageHeight;
@property (nonatomic, assign) CGFloat titleWidth;
@property (nonatomic, assign) CGFloat titleHeight;

@end

@implementation XBorderTagButton

+ (instancetype)buttonWithBorderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)radius type:(XBorderTagButtonType)type;
{
    XBorderTagButton *button = [XBorderTagButton buttonWithType:UIButtonTypeCustom];
    button.type = type;
    if (borderWidth) {
        button.layer.borderWidth = borderWidth;
    }
    if (radius) {
        button.layer.cornerRadius = radius;
    }
    button.marginAtEnds = button.marginAtEnds ? button.marginAtEnds : 3;
    button.spacingOfImageAndTitle = button.spacingOfImageAndTitle ?button.spacingOfImageAndTitle : 5;
    return button;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    _imageWidth = image.size.width;
    _imageHeight = image.size.height;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self.titleLabel sizeToFit];
    _titleWidth = self.titleLabel.frame.size.width;
    _titleHeight = self.titleLabel.frame.size.height;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_imageWidth * _titleWidth) {
        
        [self layoutWithButtonType];
    }else {
        
        [self setContentEdgeInsets:UIEdgeInsetsMake(0,  _marginAtEnds, 0, _marginAtEnds)];
    }
}


- (void)layoutWithButtonType
{
    switch (self.type) {
        case XBorderTagButtonTypeTitleLeftAndImageRight:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, _titleWidth + _spacingOfImageAndTitle * 0.5, 0, -_titleWidth - _spacingOfImageAndTitle * 0.5)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -_imageWidth - _spacingOfImageAndTitle * 0.5, 0, _imageWidth + _spacingOfImageAndTitle * 0.5)];
            [self setContentEdgeInsets:UIEdgeInsetsMake(0, _spacingOfImageAndTitle * 0.5 + _marginAtEnds, 0, _spacingOfImageAndTitle * 0.5 +_marginAtEnds)];
        }
            break;
        case XBorderTagButtonTypeImageUpAndTitleDown:
        {
            CGFloat imageOffsetX = (_imageWidth + _titleWidth) * 0.5 - _imageWidth * 0.5;
            CGFloat imageOffsetY = _titleHeight * 0.5 + _spacingOfImageAndTitle * 0.5;
            CGFloat labelOffsetX = (_imageWidth + _titleWidth * 0.5) - (_imageWidth + _titleWidth) * 0.5;
            CGFloat labelOffsetY = _imageHeight * 0.5 + _spacingOfImageAndTitle * 0.5;
            
            [self setImageEdgeInsets:UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX)];
            [self setTitleEdgeInsets: UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX)];
            
            self.contentEdgeInsets = _imageWidth > _titleWidth ? UIEdgeInsetsMake(imageOffsetY + _marginAtEnds, -imageOffsetX +_marginAtEnds, imageOffsetY + _marginAtEnds, -imageOffsetX +_marginAtEnds) : UIEdgeInsetsMake(imageOffsetY + _marginAtEnds, -labelOffsetX +_marginAtEnds, imageOffsetY + _marginAtEnds, -labelOffsetX +_marginAtEnds);
        }
            break;
        case XBorderTagButtonTypeNormal:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -_spacingOfImageAndTitle * 0.5, 0,  _spacingOfImageAndTitle * 0.5)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  _spacingOfImageAndTitle * 0.5, 0, - _spacingOfImageAndTitle * 0.5)];
            [self setContentEdgeInsets:UIEdgeInsetsMake(0, _spacingOfImageAndTitle * 0.5 + _marginAtEnds, 0, _spacingOfImageAndTitle * 0.5 + _marginAtEnds)];
        }
            break;
        default:
            break;
    }
}

@end
