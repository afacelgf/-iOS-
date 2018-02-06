//
//  UIAlertController+Lgfinit.h
//  sharedBooks
//
//  Created by XunFengKJ on 2018/1/17.
//  Copyright © 2018年 XunFengKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Lgfinit)

/**
 *  提示框,两个按钮
 *
 *  @param title          标题
 *  @param message        内容
 *  @param checkBlock     确定的回调
 *  @return 创建好的提示框
 */
+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message checkBlock:(void (^)())checkBlock;
/**
 *  提示框,两个按钮
 *
 *  @param title          标题
 *  @param cancleTitle    左边按钮标题
 *  @param sureTiTle      右边按钮标题
 *  @param message        内容
 *  @param checkBlock     确定的回调
 *  @return 创建好的提示框
 */
+(UIAlertController *)alertTitle:(NSString *)title cancleTitle:(NSString *)cancleTitle sureTiTle:(NSString *)sureTiTle message:(NSString *)message checkBlock:(void (^)())checkBlock;
/**
 *  提示框,一个按钮
 *
 *  @param title          标题
 *  @param message        内容
 *  @param checkBlock     确定的回调
 *  @return 创建好的提示框
 */
+(UIAlertController *)alertOneBtnTitle:(NSString *)title message:(NSString *)message checkBlock:(void (^)())checkBlock;


+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message goCPCBlock:(void (^)())CPCBlock  publishBlock:(void (^)())publishBlock;

/**
 *  底部弹出提示框,三按钮
 *
 *  @param title          标题
 *  @param message        内容
 *  @param firstTitle       第一个按钮标题
 *  @param firstBlock       第一个按钮回调
 *  @param secondTitle      第二个按钮标题
 *  @param secondBlock      第二个按钮回调
 *
 *  @return 创建好的提示框
 */
+ (UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message firstTitle:(NSString *)firstTitle andHander:(void (^)())firstBlock secondTitle:(NSString *)secondTitle andHander:(void (^)())secondBlock;

/**
 *  创建一个警告的提示框，不自动消失，点确定后消失
 *
 *  @param title          提示标题
 *  @param message        提示信息
 *
 *  @return 返回alertController对象
 */
+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message;

/**
 *  提示框一段时间后自动消失
 *
 *  @param title          提示标题
 *  @param message        提示信息
 *  @param timeInterval   何时消失
 *
 *  @return 返回alertController对象
 */
+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message dimissAfter:(NSTimeInterval)timeInterval;

/**
 *  弹出输入框
 *
 *  @param title          提示标题
 *  @param message        提示信息
 *  @param placeholder    输入框提示语
 *  @param cancelBlock    取消按钮回调block
 *  @param checkBlock     确认按钮回调block
 *
 *  @return 提示框
 */
+ (UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message placeholder:(NSString *)placeholder contentText:(NSString *)contentText cancelBlock:(void (^)())cancelBlock checkBlock:(void (^)(NSString * inputText))checkBlock;


+(UIAlertController *)UpdateAlertTitle:(NSString *)title message:(NSString *)message sureBtnTitle:(NSString*)sureBtnTitle cancelBtnTitle:(NSString*)cancelBtnTitle isCancel:(BOOL)iscancel checkBlock:(void (^)())checkBlock;

@end
