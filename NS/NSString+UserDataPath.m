//
//  NSString+UserDataPath.m
//  
//
//  Created by Freedom on 16/7/6.
//  Copyright © 2016年 Freedom. All rights reserved.
//

#import "NSString+UserDataPath.h"

@implementation NSString (UserDataPath)

+(NSString *)userDataPathWithPath:(NSString*)pathString
{
    NSString *path=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:pathString];
    
    return path;

}

@end
