//
//  UIBarButtonItem+Extension.h
//  MyShoppingApp
//
//  Created by Mac on 16/1/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  导航栏左侧按钮，带文字
 *
 *  @param target    一般写self
 *  @param action    触发事件
 *  @param image     普通状态下按钮图片
 *  @param highimage 点击状态下按钮图片
 *  @param title    按钮文字
 *
 *  @return 导航栏按钮
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highimage title:(NSString *)title;

/**
 *  自定义导航栏按钮，按钮大小与图片一致
 *
 *  @param target    一般写self
 *  @param action    点击该按钮执行的方法
 *  @param image     普通状态下按钮图片
 *  @param highimage 点击状态下按钮图片
 *
 *  @return 导航栏按钮
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highimage;

/**
 *  自定义导航栏按钮（可设置按钮大小，图片偏移）
 *
 *  @param target    一般写self
 *  @param action    点击该按钮执行的方法
 *  @param image     普通状态下按钮图片
 *  @param highimage 点击状态下按钮图片
 *  @param width 按钮大小，设置为0，按钮大小与图片一致
 *  @param offset 图片偏移，正数代表图片往右移动
 *
 *  @return 导航栏按钮
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highimage width:(CGFloat)width imageOffset:(CGFloat)offset;

@end
