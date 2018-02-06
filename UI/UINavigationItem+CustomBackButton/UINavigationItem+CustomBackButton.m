//
//  UINavigationItem.m
//  SportsLand
//
//  Created by Mi on 14/11/9.
//  Copyright (c) 2014年 Mi. All rights reserved.
//

#import "UINavigationItem+CustomBackButton.h"
#import <UIKit/UIKit.h>
@implementation UINavigationItem (CustomBackButton)

-(UIBarButtonItem *)backBarButtonItem{
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

@end
