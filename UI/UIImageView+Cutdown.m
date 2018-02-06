//
//  UIImageView+Cutdown.m
//  sharedBooks
//
//  Created by XunFengKJ on 2017/8/4.
//  Copyright © 2017年 XunFengKJ. All rights reserved.
//

#import "UIImageView+Cutdown.h"

@implementation UIImageView (Cutdown)
- (void)lf_setImageWithURL:(NSString *)urlStr placeHolderImage:(UIImage *)placeHolderImage{
    [self lf_setImageWithURL:urlStr placeHolderImage:placeHolderImage quality:1];
}

- (void)lf_setImageWithURL:(NSString *)urlStr placeHolderImage:(UIImage *)placeHolderImage quality:(CGFloat)quality{
    CGSize size = CGSizeMake(170*2, 220*2);//书吧应用的大小尺寸，按需求改
   [self lf_setImageWithURL:urlStr placeHolderImage:placeHolderImage quality:1 cutDownToSize:size];
}

- (void)lf_setImageWithURL:(NSString *)urlStr placeHolderImage:(UIImage *)placeHolderImage quality:(CGFloat)quality cutDownToSize:(CGSize)size{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSString *cacheUrlStr = [urlStr stringByAppendingString:@"compressCache"];
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheUrlStr];
    if (cacheImage){
        [self  sd_cancelCurrentImageLoad];
        self.image = cacheImage;
    }else{
        [self sd_setImageWithURL:url placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (!error) {
                //图片压缩质量
                NSData *smallImageData = UIImageJPEGRepresentation(image, quality);
                UIImage *smallImage = [UIImage imageWithData:smallImageData];
                //图片压缩尺寸大小
//
               
                UIGraphicsBeginImageContext(size);
                [smallImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
                UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                self.image = resultImage;
                //                LGFLog(@"图片大小：%fk",[smallImageData length]/1000.0);
                //                LGFLog(@"resultImage = %@",resultImage);
                [[SDImageCache sharedImageCache] storeImage:resultImage forKey:cacheUrlStr];
                //清除原来图片缓存
                [[SDImageCache sharedImageCache] removeImageForKey:urlStr];
            }
        }];
    }
}


@end
