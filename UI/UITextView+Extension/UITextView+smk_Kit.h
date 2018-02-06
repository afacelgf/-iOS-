//
//  UITextView+smk_Kit.h
//  mike2.0
//
//  Created by 佐毅 on 15/10/3.
//  Copyright © 2015年 上海乐住信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextView+SMKLimit.h"
#import "UITextView+smk_Placeholder.h"
@interface UITextView (smk_Kit)

@end
@interface UITextView (smk_inputAccessoryView)

@property (weak, nonatomic) UIResponder *smk_lastFirstResponder;
@property (weak, nonatomic) UIResponder *smk_nextFirstResponder;
@property (assign, nonatomic) BOOL smk_showInputAccessoryView; // 自动展示SMKInputAccessoryView工具条

@end