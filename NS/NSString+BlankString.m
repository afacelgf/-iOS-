//
//  NSString+BlankString.m
//  sharedBooks
//
//  Created by XunFengKJ on 2016/11/12.
//  Copyright © 2016年 XunFengKJ. All rights reserved.
//

#import "NSString+BlankString.h"

@implementation NSString (BlankString)
/**
 *  判断字符串是否为空
 */
+(BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
@end
