//
//  NSToastView.m
//  NSToastView
//
//  Created by RAHUL'S MAC MINI on 19/08/15.
//  Copyright (c) 2015 rahul-apple. All rights reserved.
//

#import "NSToastView.h"

#define NS_TOAST_VIEW_ANIMATION_DURATION  0.5f
#define NS_TOAST_VIEW_OFFSET_BOTTOM  61.0f
#define NS_TOAST_VIEW_OFFSET_LEFT_RIGHT  8.0f
#define NS_TOAST_VIEW_OFFSET_TOP  76.0f
#define NS_TOAST_VIEW_SHOW_DURATION  3.0f
#define NS_TOAST_VIEW_SHOW_DELAY  0.0f
#define NS_TOAST_VIEW_TAG 1024
#define NS_TOAST_VIEW_TEXT_FONT_SIZE  17.0f

static UIColor *_backgroundColor = nil;
static UIColor *_textColor = nil;
static UIFont *_textFont = nil;
static CGFloat _cornerRadius = 5.0f;
static CGFloat _duration = NS_TOAST_VIEW_SHOW_DURATION;
static CGFloat _maxWidth = 0.0f;
static CGFloat _maxHeight = 0.0f;
static CGFloat _offsetBottom = NS_TOAST_VIEW_OFFSET_BOTTOM;
static CGFloat _offsetTop = NS_TOAST_VIEW_OFFSET_TOP;
static UIEdgeInsets _textInsets;
static NSTextAlignment _textAligment = NSTextAlignmentCenter;

@interface NSToastView ()

@end

@implementation NSToastView

#pragma -mark NSToastView Configuration Methods

+ (void)setAppearanceBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = [backgroundColor copy];
}

+ (void)setAppearanceCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
}

+ (void)setAppearanceMaxHeight:(CGFloat)maxHeight {
    _maxHeight = maxHeight;
}

+ (void)setAppearanceMaxWidth:(CGFloat)maxWidth {
    _maxWidth = maxWidth;
}

+ (void)setAppearanceOffsetBottom:(CGFloat)offsetBottom {
    _offsetBottom = offsetBottom;
}

+ (void)setAppearanceTextAligment:(NSTextAlignment)textAlignment {
    _textAligment = textAlignment;
}

+ (void)setAppearanceTextColor:(UIColor *)textColor {
    _textColor = [textColor copy];
}

+ (void)setAppearanceTextFont:(UIFont *)textFont {
    _textFont = [textFont copy];
}

+ (void)setAppearanceTextInsets:(UIEdgeInsets)textInsets {
    _textInsets = textInsets;
}

+ (void)setToastViewShowDuration:(NSTimeInterval)duration {
    _duration = duration;
}

#pragma mark - ToastView Show
+ (void)showToast:(id)toast {
    return [self showToast:toast duration:_duration];
}

+ (void)showToast:(id)toast duration:(NSTimeInterval)duration {
    return [self showToast:toast duration:duration delay:NS_TOAST_VIEW_SHOW_DELAY];
}

+ (void)showToast:(id)toast delay:(NSTimeInterval)delay {
    return [self showToast:toast duration:_duration delay:delay];
}

+ (void)showToast:(id)toast completion:(NSToastBlock)completion {
    return [self showToast:toast duration:_duration completion:completion];
}

+ (void)showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    return [self showToast:toast duration:duration delay:delay completion:nil];
}

+ (void)showToast:(id)toast duration:(NSTimeInterval)duration completion:(NSToastBlock)completion {
    return [self showToast:toast duration:duration delay:NS_TOAST_VIEW_SHOW_DELAY completion:completion];
}

+ (void)showToast:(id)toast delay:(NSTimeInterval)delay completion:(NSToastBlock)completion {
    return [self showToast:toast duration:_duration delay:delay completion:completion];
}

+ (void)showToast:(id)toast duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay completion:(NSToastBlock)completion {
    NSString *toastText = [NSString stringWithFormat:@"%@", toast];
    if (toastText.length < 1) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIView *keyWindowView = [self _keyWindowView];
        if (!keyWindowView) {
            return;
        }
        [[keyWindowView viewWithTag:NS_TOAST_VIEW_TAG] removeFromSuperview];
        [keyWindowView endEditing:YES];
        
        UIView *toastView = [UIView new];
        toastView.translatesAutoresizingMaskIntoConstraints = NO;
        toastView.userInteractionEnabled = NO;
        toastView.backgroundColor = [self _backgroundColor];
        toastView.tag = NS_TOAST_VIEW_TAG;
        toastView.clipsToBounds = YES;
        toastView.alpha = 0.0f;
        
        UILabel *toastLabel = [UILabel new];
        toastLabel.translatesAutoresizingMaskIntoConstraints = NO;
        toastLabel.font = [self _textFont];
        toastLabel.text = toastText;
        toastLabel.textColor = [self _textColor];
        toastLabel.textAlignment = _textAligment;
        toastLabel.numberOfLines = 0;
        
        [self _maxWidth];
        [self _maxHeight];
        
        // One line text's height
        CGFloat toastTextHeight = [@"NS" sizeWithAttributes:@{ NSFontAttributeName:[self _textFont], }].height + 0.5f;
        
        // ToastView's textInsets
        if (UIEdgeInsetsEqualToEdgeInsets(_textInsets, UIEdgeInsetsZero)) {
            _textInsets = UIEdgeInsetsMake(toastTextHeight / 2.0f, toastTextHeight, toastTextHeight / 2.0f, toastTextHeight);
        }
        
        // ToastView's cornerRadius
        toastTextHeight += (_textInsets.top + _textInsets.bottom);
        if (toastTextHeight > _maxHeight) {
            toastTextHeight = _maxHeight;
        }
        if (_cornerRadius <= 0.0f || _cornerRadius > toastTextHeight / 2.0f) {
            toastView.layer.cornerRadius = toastTextHeight / 2.0f;
        } else {
            toastView.layer.cornerRadius = _cornerRadius;
        }
        
        // ToastView's size
        CGSize toastLabelSize = [toastLabel sizeThatFits:CGSizeMake(_maxWidth - (_textInsets.left + _textInsets.right), _maxHeight - (_textInsets.top + _textInsets.bottom))];
        CGFloat toastViewWidth = (toastLabelSize.width + 0.5f) + (_textInsets.left + _textInsets.right);
        CGFloat toastViewHeight = (toastLabelSize.height + 0.5f) + (_textInsets.top + _textInsets.bottom);
        
        if (toastViewWidth > _maxWidth) {
            toastViewWidth = _maxWidth;
        }
        
        if (toastViewHeight > _maxHeight) {
            toastViewHeight = _maxHeight;
        }
        
        NSDictionary *views = NSDictionaryOfVariableBindings(toastLabel, toastView);
        [toastView addSubview:toastLabel];
        [keyWindowView addSubview:toastView];
        
        [toastView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-(%@)-[toastLabel]-(%@)-|", @(_textInsets.left), @(_textInsets.right)]
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
        [toastView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-(%@)-[toastLabel]-(%@)-|", @(_textInsets.top), @(_textInsets.bottom)]
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
        
        [keyWindowView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[toastView(%@)]", @(toastViewWidth)]
                                                                              options:0
                                                                              metrics:nil
                                                                                views:views]];
        [keyWindowView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-(>=%@)-[toastView(<=%@)]-(%@)-|", @(_offsetTop), @(toastViewHeight), @(_offsetBottom)]
                                                                              options:0
                                                                              metrics:nil
                                                                                views:views]];
        [keyWindowView addConstraint:[NSLayoutConstraint constraintWithItem:toastView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:keyWindowView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0f
                                                                   constant:0.0f]];
        [keyWindowView layoutIfNeeded];
        
        [UIView animateWithDuration:NS_TOAST_VIEW_ANIMATION_DURATION animations: ^{
            toastView.alpha = 1.0f;
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:NS_TOAST_VIEW_ANIMATION_DURATION animations: ^{
                toastView.alpha = 0.0f;
            } completion: ^(BOOL finished) {
                [toastView removeFromSuperview];
                
                NSToastBlock block = [completion copy];
                if (block) {
                    block();
                }
            }];
        });
    });
}

#pragma mark - Private Methods

+ (UIFont *)_textFont {
    if (_textFont == nil) {
        _textFont = [UIFont systemFontOfSize:NS_TOAST_VIEW_TEXT_FONT_SIZE];
    }
    return _textFont;
}

+ (UIColor *)_textColor {
    if (_textColor == nil) {
        _textColor = [UIColor whiteColor];
    }
    return _textColor;
}

+ (UIColor *)_backgroundColor {
    if (_backgroundColor == nil) {
        _backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6f];
    }
    return _backgroundColor;
}

+ (CGFloat)_maxHeight {
    if (_maxHeight <= 0) {
        _maxHeight = [self _portraitScreenHeight] - (_offsetBottom + NS_TOAST_VIEW_OFFSET_TOP);
    }
    
    return _maxHeight;
}

+ (CGFloat)_maxWidth {
    if (_maxWidth <= 0) {
        _maxWidth = [self _portraitScreenWidth] - (NS_TOAST_VIEW_OFFSET_LEFT_RIGHT + NS_TOAST_VIEW_OFFSET_LEFT_RIGHT);
    }
    return _maxWidth;
}

+ (CGFloat)_portraitScreenWidth {
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? CGRectGetWidth([UIScreen mainScreen].bounds) : CGRectGetHeight([UIScreen mainScreen].bounds);
}

+ (CGFloat)_portraitScreenHeight {
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? CGRectGetHeight([UIScreen mainScreen].bounds) : CGRectGetWidth([UIScreen mainScreen].bounds);
}

+ (UIView *)_keyWindowView {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows firstObject];
    }
    return window;
}

@end
