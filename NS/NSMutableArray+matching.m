//
//  NSMutableArray+matching.m
//  sharedBooks
//
//  Created by XunFengKJ on 2017/6/22.
//  Copyright © 2017年 XunFengKJ. All rights reserved.
//

#import "NSMutableArray+matching.h"

@implementation NSMutableArray (matching)

+(NSString *)matchingStringWithDataArr:(NSArray*)dataArr{
    //拼接
    NSString *resultStr = @"";
    for (NSString *str in dataArr) {
        resultStr = [resultStr stringByAppendingString:[NSString stringWithFormat:@"%@,",str]];
    }
    if (resultStr.length>1) {
        resultStr = [resultStr substringToIndex:resultStr.length-1];
    }
    return resultStr ;
}

@end
