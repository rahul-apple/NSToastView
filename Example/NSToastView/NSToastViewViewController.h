//
//  NSToastViewViewController.h
//  NSToastView
//
//  Created by rahul-apple on 08/19/2015.
//  Copyright (c) 2015 rahul-apple. All rights reserved.
//

@import UIKit;

@interface NSToastViewViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *toastText;
@property (strong, nonatomic) IBOutlet UIButton *toastButton;
@property (strong, nonatomic) IBOutlet UIView *configContainer;

- (IBAction)toastIt:(id)sender;
@end
