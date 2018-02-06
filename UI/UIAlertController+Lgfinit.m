//
//  UIAlertController+Lgfinit.m
//  sharedBooks
//
//  Created by XunFengKJ on 2018/1/17.
//  Copyright © 2018年 XunFengKJ. All rights reserved.
//

#import "UIAlertController+Lgfinit.h"

@implementation UIAlertController (Lgfinit)
//两个按钮,可以继续加
+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message checkBlock:(void (^)())checkBlock
{
    UIAlertController *alertC=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //取消
    UIAlertAction *cancleBtn=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    //确定
    UIAlertAction *checkBtn=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (checkBlock) {
            checkBlock();
        }
    }];
    
    [alertC addAction:cancleBtn];
    [alertC addAction:checkBtn];
    return alertC;
}
//两个按钮,可以继续加
+(UIAlertController *)alertTitle:(NSString *)title cancleTitle:(NSString *)cancleTitle sureTiTle:(NSString *)sureTiTle message:(NSString *)message checkBlock:(void (^)())checkBlock
{
    UIAlertController *alertC=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //取消
    UIAlertAction *cancleBtn=[UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:nil];
    //确定
    UIAlertAction *checkBtn=[UIAlertAction actionWithTitle:sureTiTle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (checkBlock) {
            checkBlock();
        }
    }];
    
    [alertC addAction:cancleBtn];
    [alertC addAction:checkBtn];
    return alertC;
}
/**
 *  提示框,一个按钮
 */
+(UIAlertController *)alertOneBtnTitle:(NSString *)title message:(NSString *)message checkBlock:(void (^)())checkBlock{
    UIAlertController *alertC=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //确定
    UIAlertAction *checkBtn=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (checkBlock) {
            checkBlock();
        }
    }];
    [alertC addAction:checkBtn];
    return alertC;
}


//两个按钮,可以继续加
+(UIAlertController *)UpdateAlertTitle:(NSString *)title message:(NSString *)message sureBtnTitle:(NSString*)sureBtnTitle cancelBtnTitle:(NSString*)cancelBtnTitle isCancel:(BOOL)iscancel checkBlock:(void (^)())checkBlock
{
    UIAlertController *alertC=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //取消
    if (!iscancel) {
        UIAlertAction *cancleBtn = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:nil];
        [alertC addAction:cancleBtn];
    }
    //确定
    UIAlertAction *checkBtn=[UIAlertAction actionWithTitle:sureBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (checkBlock) {
            checkBlock();
        }
    }];
    
    [alertC addAction:checkBtn];
    return alertC;
}

//两个按钮（精彩分享用：选择直接发表或去CPC发表）
+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message goCPCBlock:(void (^)())CPCBlock  publishBlock:(void (^)())publishBlock
{
    UIAlertController *alertC=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    //去CPC发表
    UIAlertAction *cancleBtn=[UIAlertAction actionWithTitle:@"去CPC发表" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (CPCBlock) {
            CPCBlock();
        }
    }];
    //直接发布分享
    UIAlertAction *checkBtn=[UIAlertAction actionWithTitle:@"直接发表" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (publishBlock) {
            publishBlock();
        }
    }];
    
    [alertC addAction:cancleBtn];
    [alertC addAction:checkBtn];
    return alertC;
}

//三个按钮，弹出框
+ (UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message firstTitle:(NSString *)firstTitle andHander:(void (^)())firstBlock secondTitle:(NSString *)secondTitle andHander:(void (^)())secondBlock
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    //默认带有取消按钮
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    //第一个按钮
    UIAlertAction *tow = [UIAlertAction actionWithTitle:firstTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (firstBlock)
            firstBlock();
    }];
    //    tow.style = UIAlertActionStyleDestructive;
    
    //第二个按钮
    if (secondTitle.length > 0) {
        UIAlertAction *three = [UIAlertAction actionWithTitle:secondTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (secondBlock)
                secondBlock();
        }];
        [alertC addAction:three];
    }
    
    
    [alertC addAction:cancel];
    [alertC addAction:tow];
    
    
    return alertC;
}

/** 创建一个警告的提示框 */
+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message
{
    
    UIAlertController *alertC=[UIAlertController  alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancle = [UIAlertAction  actionWithTitle:title style:UIAlertActionStyleCancel handler:nil];
    [alertC  addAction:actionCancle];
    return alertC;
}

/** 提示框一段时间后消失 */
+(UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message dimissAfter:(NSTimeInterval)timeInterval
{
    UIAlertController *alertC=[UIAlertController  alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertC dismissViewControllerAnimated:YES completion:nil];
    });;
    
    return alertC;
}

+ (UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message placeholder:(NSString *)placeholder contentText:(NSString *)contentText cancelBlock:(void (^)())cancelBlock checkBlock:(void (^)(NSString * inputText))checkBlock
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertC addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = placeholder;
        textField.text = contentText;
        textField.secureTextEntry = YES;
        
    }];
    //取消
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        if (cancelBlock)
            cancelBlock();
    }];
    
    //确认
    UIAlertAction *check = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action ){
        UITextField *textField = alertC.textFields.firstObject;
        checkBlock(textField.text);
    }];
    
    [alertC addAction:check];
    [alertC addAction:cancel];
    return alertC;
}

@end
