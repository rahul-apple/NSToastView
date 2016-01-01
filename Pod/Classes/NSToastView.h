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
+ (void)setAppearanceBackgroundColor:(UIColor *)backgroundColor;
+ (void)setAppearanceCornerRadius:(CGFloat)cornerRadius;
+ (void)setAppearanceMaxHeight:(CGFloat)maxHeight;
+ (void)setAppearanceMaxWidth:(CGFloat)maxWidth;
+ (void)setAppearanceOffsetBottom:(CGFloat)offsetBottom;
+ (void)setAppearanceTextAligment:(NSTextAlignment)textAlignment;
+ (void)setAppearanceTextColor:(UIColor *)textColor;
+ (void)setAppearanceTextFont:(UIFont *)textFont;
+ (void)setAppearanceTextInsets:(UIEdgeInsets)textInsets;
+ (void)setToastViewShowDuration:(NSTimeInterval)duration;

/**
 *  ToastView Show
 */
+ (void)showToast:(id)toast;
+ (void)showToast:(id)toast duration:(NSTimeInterval)duration;
+ (void)showToast:(id)toast delay:(NSTimeInterval)delay;
+ (void)showToast:(id)toast completion:(NSToastBlock)completion;
+ (void)showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay;
+ (void)showToast:(id)toast duration:(NSTimeInterval)duration completion:(NSToastBlock)completion;
+ (void)showToast:(id)toast delay:(NSTimeInterval)delay completion:(NSToastBlock)completion;
+ (void)showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay completion:(NSToastBlock)completion;
@end
