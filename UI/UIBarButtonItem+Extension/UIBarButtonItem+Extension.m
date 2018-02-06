//
//  UIBarButtonItem+Extension.m
//  MyShoppingApp
//
//  Created by Mac on 16/1/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
//一般用于设置导航栏左边按钮，且带文字
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highimage title:(NSString *)title
{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image.length != 0)
    {
      [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }

    if (highimage.length != 0)
     [btn setImage:[UIImage imageNamed:highimage] forState:UIControlStateHighlighted];
    //标题
    if (title.length != 0)
    {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    }
    //设置按钮的所有内容(包括文字，图片)对齐方式，contentMode一般只针对图片，不包括文字的
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //设置按钮内容内边距
    btn.contentEdgeInsets =  UIEdgeInsetsMake(0, -5, 0, 0);

    //按钮的大小，等于图片的大小
//    btn.size = btn.currentImage.size;
    btn.size = CGSizeMake(25, 44);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highimage
{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    if (highimage != nil)
    [btn setBackgroundImage:[UIImage imageNamed:highimage] forState:UIControlStateHighlighted];
    //按钮的大小，等于背景图片的大小
    btn.size = btn.currentBackgroundImage.size;
    //添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highimage width:(CGFloat)width imageOffset:(CGFloat)offset
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.contentMode = UIViewContentModeCenter;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //测试用颜色
//    btn.backgroundColor = [UIColor redColor];
    
    if (highimage != nil)
    [btn setImage:[UIImage imageNamed:highimage] forState:UIControlStateHighlighted];
    if (width)
       btn.size = CGSizeMake(width, 44);
    else
        btn.size = btn.currentImage.size;
    
    //大于0,图片往右边偏移，小于0,图片往左边偏移
    if (offset >= 0 )
         btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -offset);
    else
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, offset, 0, 0);
    //添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
