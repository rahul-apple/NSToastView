//
//  NSToastView.h
//  NSToastView
//
//  Created by RAHUL'S MAC MINI on 19/08/15.
//  Copyright (c) 2015 rahul-apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NSToastBlock)(void);

@interface NSToastView : UIView

/**
 *  ToastView Config
 */
+ (void)nsSetAppearanceBackgroundColor:(UIColor *)backgroundColor;
+ (void)nsSetAppearanceCornerRadius:(CGFloat)cornerRadius;
+ (void)nsSetAppearanceMaxHeight:(CGFloat)maxHeight;
+ (void)nsSetAppearanceMaxWidth:(CGFloat)maxWidth;
+ (void)nsSetAppearanceOffsetBottom:(CGFloat)offsetBottom;
+ (void)nsSetAppearanceTextAligment:(NSTextAlignment)textAlignment;
+ (void)nsSetAppearanceTextColor:(UIColor *)textColor;
+ (void)nsSetAppearanceTextFont:(UIFont *)textFont;
+ (void)nsSetAppearanceTextInsets:(UIEdgeInsets)textInsets;
+ (void)nsSetToastViewShowDuration:(NSTimeInterval)duration;

/**
 *  ToastView Show
 */
+ (void)nsShowToast:(id)toast;
+ (void)nsShowToast:(id)toast duration:(NSTimeInterval)duration;
+ (void)nsShowToast:(id)toast delay:(NSTimeInterval)delay;
+ (void)nsShowToast:(id)toast completion:(NSToastBlock)completion;
+ (void)nsShowToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay;
+ (void)nsShowToast:(id)toast duration:(NSTimeInterval)duration completion:(NSToastBlock)completion;
+ (void)nsShowToast:(id)toast delay:(NSTimeInterval)delay completion:(NSToastBlock)completion;
+ (void)nsShowToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay completion:(NSToastBlock)completion;
@end