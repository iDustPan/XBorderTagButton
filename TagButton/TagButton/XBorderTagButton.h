//
//  XBorderTagButton.h
//  TagButton
//
//  Created by 徐攀 on 2016/12/20.
//  Copyright © 2016年 com.borderXLab. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XBorderTagButtonType) {
    XBorderTagButtonTypeNormal = 0,
    XBorderTagButtonTypeImageUpAndTitleDown,
    XBorderTagButtonTypeTitleLeftAndImageRight
};

@interface XBorderTagButton : UIButton

@property (nonatomic, assign) XBorderTagButtonType type;

/** 图片和title的间距 */
@property (nonatomic, assign) CGFloat spacingOfImageAndTitle;
/** 端距 */
@property (nonatomic, assign) CGFloat marginAtEnds;

+ (instancetype)buttonWithBorderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)radius type:(XBorderTagButtonType)type;

@end
