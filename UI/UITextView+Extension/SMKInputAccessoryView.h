//
//  SMKInputAccessoryView.h
//  mike2.0
//
//  Created by 佐毅 on 15/10/3.
//  Copyright © 2015年 上海乐住信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMKInputAccessoryView : UIToolbar
/**
 *  @brief 相应的对象
 */
@property (weak,nonatomic) UIResponder *targert;
/**
 *  @brief 最后相应的对象
 */
@property (weak,nonatomic) UIResponder *lastFirstResponder;

/**
 *  @brief 下一个相应的对象
 */
@property (weak,nonatomic) UIResponder *nextFirstResponder;

/**
 *  @brief 完成最后一个操作返回的block
 */
@property (copy, nonatomic) void (^doneBlock)(void);



/**
 *  @brief  初始化键盘工具条
 *
 *  @param targert            要将工具条添加到的目标
 *  @param lastFirstResponder 上一个要获取键盘焦点的响应器
 *  @param nextFirstResponder 下一个要获取键盘焦点的响应器
 *  @param doneBlock          点击完成后要做的事
 *
 *  @return 本工具条
 */
- (instancetype)initWithTargert:(UIResponder *)targert last:(UIResponder *)lastFirstResponder next:(UIResponder *)nextFirstResponder doneBlock:(void(^)(void))doneBlock;
@end
