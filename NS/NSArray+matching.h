//
//  NSArray+matching.h
//  XMCXOperationManager
//
//  Created by XunFengKJ on 2017/6/6.
//  Copyright © 2017年 XunFengKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (matching)
//拼接数组中的元素 eg:[1,2,3]-->1,2,3
+(NSString *)matchingStringWithDataArr:(NSArray*)dataArr;
@end
