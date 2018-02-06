//
//  UIImageView+Cutdown.h
//  sharedBooks
//
//  Created by XunFengKJ on 2017/8/4.
//  Copyright © 2017年 XunFengKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Cutdown)
- (void)lf_setImageWithURL:(NSString *)urlStr placeHolderImage:(UIImage *)placeHolderImage;
- (void)lf_setImageWithURL:(NSString *)urlStr placeHolderImage:(UIImage *)placeHolderImage quality:(CGFloat)quality;
- (void)lf_setImageWithURL:(NSString *)urlStr placeHolderImage:(UIImage *)placeHolderImage quality:(CGFloat)quality cutDownToSize:(CGSize)size;
@end
