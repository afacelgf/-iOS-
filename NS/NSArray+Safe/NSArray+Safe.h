//
//  NSArray+Safe.h
//  mike2.0
//
//  Created by Mi on 15/9/17.
//  Copyright (c) 2015年 flychi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)

//NSArray objectAtIndex:的安全方法，避免数组越界造成的崩溃
- (id)safeObjectAtIndex:(NSInteger)index;
@end
