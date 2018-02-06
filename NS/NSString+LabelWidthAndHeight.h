//
//  NSString+LabelWidthAndHeight.h
//  ZiPeiYi
//
//  Created by YouXianMing on 15/12/9.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LabelWidthAndHeight)

#pragma mark - StringAttribute.

/**
 *  传入属性和宽度得到高度
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)heightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width;

/**
 *  传入属性得到宽度
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
- (CGFloat)widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

/**
 *  一行label的高度
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
+ (CGFloat)oneLineOfTextHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;
/**
 *  得到一行字符的高度
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
+ (CGFloat)oneLineOfTextHeightWithStringFont:(UIFont *)font;
#pragma mark - Font.

/**
 *  传入font和宽度得到高度
 *
 *  @param font  String's font.
 *  @param width Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)heightWithStringFont:(UIFont *)font fixedWidth:(CGFloat)width;

/**
 *  传入font得到宽度
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
- (CGFloat)widthWithStringFont:(UIFont *)font;



@end
