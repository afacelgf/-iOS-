//
//  UIButton+LGFInit.m
//  sharedBooks
//
//  Created by XunFengKJ on 2016/12/22.
//  Copyright © 2016年 XunFengKJ. All rights reserved.
//

#import "UIButton+LGFInit.h"
#import <objc/runtime.h>
@implementation UIButton (LGFInit)
+(UIButton*)buttomWithTitle:(NSString*)title titleNormalColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor font:(NSInteger)sizeOfFont normalBackgroundImage:(NSString*)normalBackgroundImage selectBackgroundImage:(NSString*)selectBackgroundImage{
    UIButton *btn = [self buttomWithTitle:title titleNormalColor:titleColor titleSelectColor:nil backgroundColor:backgroundColor font:sizeOfFont normalBackgroundImage:normalBackgroundImage selectBackgroundImage:selectBackgroundImage];
    return btn;
}

+(UIButton*)buttomWithTitle:(NSString*)title titleNormalColor:(UIColor*)titleNormalColor titleSelectColor:(UIColor*)titleSelectColor backgroundColor:(UIColor*)backgroundColor font:(NSInteger)sizeOfFont normalBackgroundImage:(NSString*)normalBackgroundImage selectBackgroundImage:(NSString*)selectBackgroundImage{
    
    UIButton *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleNormalColor forState:UIControlStateNormal];
    [btn setTitleColor:titleSelectColor forState:UIControlStateSelected];
    btn.backgroundColor = backgroundColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:sizeOfFont];
    [btn setBackgroundImage:[UIImage imageNamed:normalBackgroundImage] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectBackgroundImage] forState:UIControlStateSelected];
    return btn;
}

+(UIButton*)buttomInController:(UIViewController*)Controller normalTitle:(NSString*)normalTitle  normalTitleColor:(UIColor*)normalTitleColor disableTitleColor:(UIColor *)disableTitleColor font:(CGFloat)font backgroundColor:(UIColor*)backgroundColor touchUpInsideAction:(SEL)action{
    
    UIButton *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn setTitle:normalTitle forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [btn setTitleColor:disableTitleColor forState:UIControlStateDisabled];
    btn.backgroundColor = backgroundColor;
    [Controller.view addSubview:btn];
    [btn addTarget:Controller action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton*)buttomInController:(UIViewController*)Controller backgroundColor:(UIColor*)backgroundColor WithNoRTitle:(NSString*)btnTitle touchUpInsideAction:(SEL)action{
    
    UIButton *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:XFUIColorFromRGB(0x2b2b2b) forState:UIControlStateSelected];
    [btn setTitleColor:XFUIColorFromRGB(0x666666) forState:UIControlStateNormal];
    btn.backgroundColor = backgroundColor;
    [Controller.view addSubview:btn];
    [btn addTarget:Controller action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton*)buttomInController:(UIViewController*)Controller CornersWithCornerRadius:(CGFloat)cornerRadius WithNoRTitle:(NSString*)btnTitle font:(CGFloat)font titleColor:(UIColor *)titleColor  backgroundColor:(UIColor*)backgroundColor norImage:(UIImage *)btnImage touchUpInsideAction:(SEL)action{
    UIButton *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    [btn setImage:btnImage forState:UIControlStateNormal];
    [Controller.view addSubview:btn];
    btn.backgroundColor = backgroundColor;
    btn.layer.cornerRadius = cornerRadius;
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    btn.titleLabel.textColor = titleColor;
    btn.layer.masksToBounds = YES;
    [btn addTarget:Controller action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


- (void)addTarget:(id)target touchUpInsideAction:(SEL)action {
    
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)setNormalTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateNormal];
}

- (NSString *)normalTitle {
    
    return [self titleForState:UIControlStateNormal];
}

- (void)setHighlightedTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateHighlighted];
}

- (NSString *)highlightedTitle {
    
    return [self titleForState:UIControlStateHighlighted];
}

- (void)setNormalImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)normalImage {
    
    return [self imageForState:UIControlStateNormal];
}

- (void)setHighlightedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)highlightedImage {
    
    return [self imageForState:UIControlStateHighlighted];
}

- (void)setSelectedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateSelected];
}

- (UIImage *)selectedImage {
    
    return [self imageForState:UIControlStateSelected];
}

//定义关联的Key
static const char * titleRectKey = "titleRectKey";
- (CGRect)titleRect {
    
    return [objc_getAssociatedObject(self, titleRectKey) CGRectValue];
}

- (void)setTitleRect:(CGRect)rect {
    
    objc_setAssociatedObject(self, titleRectKey, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN);
}

//定义关联的Key
static const char * imageRectKey = "imageRectKey";
- (CGRect)imageRect {
    
    NSValue * rectValue = objc_getAssociatedObject(self, imageRectKey);
    
    return [rectValue CGRectValue];
}

- (void)setImageRect:(CGRect)rect {
    
    objc_setAssociatedObject(self, imageRectKey, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - ************* 通过运行时动态替换方法 ******************
+ (void)load {
    
    MethodSwizzle(self,@selector(titleRectForContentRect:),@selector(override_titleRectForContentRect:));
    MethodSwizzle(self,@selector(imageRectForContentRect:),@selector(override_imageRectForContentRect:));
}

void MethodSwizzle(Class c,SEL origSEL,SEL overrideSEL)
{
    
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method overrideMethod= class_getInstanceMethod(c, overrideSEL);
    
    //运行时函数class_addMethod 如果发现方法已经存在，会失败返回，也可以用来做检查用:
    if(class_addMethod(c, origSEL, method_getImplementation(overrideMethod),method_getTypeEncoding(overrideMethod)))
    {
        //如果添加成功(在父类中重写的方法)，再把目标类中的方法替换为旧有的实现:
        class_replaceMethod(c,overrideSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else
    {
        //addMethod会让目标类的方法指向新的实现，使用replaceMethod再将新的方法指向原先的实现，这样就完成了交换操作。
        method_exchangeImplementations(origMethod,overrideMethod);
    }
}

- (CGRect)override_titleRectForContentRect:(CGRect)contentRect {
    
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [self override_titleRectForContentRect:contentRect];
    
}

- (CGRect)override_imageRectForContentRect:(CGRect)contentRect {
    
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [self override_imageRectForContentRect:contentRect];
}

- (void)setTitleRect:(CGRect )titleRect ImageRect:(CGRect )imageRect {
    
    self.titleRect = titleRect;
    self.imageRect = imageRect;
}

- (void)setImagePosition:(SMKImagePosition)postion spacing:(CGFloat)spacing {
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (postion) {
        case SMKImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case SMKImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case SMKImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case SMKImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
        case SMKImagePositionTopCenter:{
            self.imageEdgeInsets = UIEdgeInsetsMake(0,0,0, -self.titleLabel.intrinsicContentSize.width);
            self.titleEdgeInsets = UIEdgeInsetsMake(100, -15, 0, 15);
            break;
        }
        default:
            break;
    }
    
}

@end
