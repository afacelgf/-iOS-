//
//  UIButton+LGFInit.h
//  sharedBooks
//
//  Created by XunFengKJ on 2016/12/22.
//  Copyright © 2016年 XunFengKJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SMKImagePosition) {
    SMKImagePositionLeft = 0,              //图片在左，文字在右，默认
    SMKImagePositionRight = 1,             //图片在右，文字在左
    SMKImagePositionTop = 2,               //图片在上，文字在下
    SMKImagePositionBottom = 3,            //图片在下，文字在上
    SMKImagePositionTopCenter = 4,         //图片在中间，文字在下面
};


@interface UIButton (LGFInit)

/**
 文字绝对布局
 */
@property (nonatomic,assign) CGRect titleRect;

/**
 图片绝对布局
 */
@property (nonatomic,assign) CGRect imageRect;

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(SMKImagePosition)postion spacing:(CGFloat)spacing;


/**
 *添加点击事件
 */
- (void)addTarget:(id)target touchUpInsideAction:(SEL)action;

/**
 *  设置高亮状态的图片.
 *
 *  @param image Image object.
 */
- (void)setHighlightedImage:(UIImage *)image;

- (UIImage *)highlightedImage;

/**
 *  设置图片.
 *
 *  @param image Normal image.
 */
- (void)setNormalImage:(UIImage *)image;
- (UIImage *)normalImage;

/**
 *  设置选中状态的图片
 *
 *  @param image Selected image.
 */
- (void)setSelectedImage:(UIImage *)image;
- (UIImage *)selectedImage;

/**
 *  设置title.
 *
 *  @param title Normal title.
 */
- (void)setNormalTitle:(NSString *)title;
- (NSString *)normalTitle;

/**
 *   设置高亮title.
 *
 *  @param title Title.
 */
- (void)setHighlightedTitle:(NSString *)title;

- (NSString *)highlightedTitle;


/**
 *  创建按钮
 *
 *  @param title               按钮标题
 *  @param titleColor          标题颜色
 *  @param backgroundColor     按钮背景颜色
 *  @param sizeOfFont          按钮字体大小
 *  @param normalBackgroundImage    按钮图片
 *  @param selectBackgroundImage    按钮选中图片
 */
+(UIButton*)buttomWithTitle:(NSString*)title titleNormalColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor font:(NSInteger)sizeOfFont normalBackgroundImage:(NSString*)normalBackgroundImage selectBackgroundImage:(NSString*)selectBackgroundImage;

/**
 *  创建按钮
 *
 *  @param title 按钮标题
 *  @param titleNormalColor    标题颜色
 *  @param titleSelectColor    标题选中颜色
 *  @param backgroundColor     按钮背景颜色
 *  @param sizeOfFont          按钮字体大小
  *  @param normalBackgroundImage    按钮图片
  *  @param selectBackgroundImage    按钮选中图片
 */
+(UIButton*)buttomWithTitle:(NSString*)title titleNormalColor:(UIColor*)titleNormalColor titleSelectColor:(UIColor*)titleSelectColor backgroundColor:(UIColor*)backgroundColor font:(NSInteger)sizeOfFont normalBackgroundImage:(NSString*)normalBackgroundImage selectBackgroundImage:(NSString*)selectBackgroundImage;

//创建按钮
/*
  * Controller 控制器
  * btnTitle 标题
  * backgroundColor 背景颜色
  * action 方法
 */

+(UIButton*)buttomInController:(UIViewController*)Controller backgroundColor:(UIColor*)backgroundColor WithNoRTitle:(NSString*)btnTitle touchUpInsideAction:(SEL)action;

//创建按钮
/*
 * Controller 控制器
 * normalTitle 标题
 * normalTitleColor 字体背景颜色
 * disableTitleColor diable字体背景颜色
 * backgroundColor 背景颜色
 * font 字体
 * action 方法
 */

+(UIButton*)buttomInController:(UIViewController*)Controller normalTitle:(NSString*)normalTitle  normalTitleColor:(UIColor*)normalTitleColor disableTitleColor:(UIColor *)disableTitleColor font:(CGFloat)font backgroundColor:(UIColor*)backgroundColor touchUpInsideAction:(SEL)action;

//创建按钮(带圆角)
/*
 * Controller 控制器
 * ornerRadius 圆角
 * btnTitle 标题
 * backgroundColor 背景颜色
 * btnImage 图片
 * action 方法
 */
+(UIButton*)buttomInController:(UIViewController*)Controller CornersWithCornerRadius:(CGFloat)cornerRadius WithNoRTitle:(NSString*)btnTitle font:(CGFloat)font titleColor:(UIColor *)titleColor  backgroundColor:(UIColor*)backgroundColor norImage:(UIImage *)btnImage touchUpInsideAction:(SEL)action;
@end
