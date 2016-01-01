//
//  NSToastViewViewController.m
//  NSToastView
//
//  Created by rahul-apple on 08/19/2015.
//  Copyright (c) 2015 rahul-apple. All rights reserved.
//

#import "NSToastViewViewController.h"
#import "NSToastView.h"
@interface NSToastViewViewController ()<UITextFieldDelegate>

@end

@implementation NSToastViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupUIComponents];
}

- (void)setupUIComponents{
    [self.configContainer.layer setCornerRadius:5.0f];
//    [self.configContainer.layer setBorderWidth:0.5f];
//    [self.configContainer.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.configContainer.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.configContainer.layer setShadowRadius:5.0f];
    [self.configContainer.layer setShadowOpacity:0.4f];
    [self.configContainer.layer setShadowOffset:CGSizeMake(2, 3)];
    [self.toastButton.layer setCornerRadius:5.0f];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toastIt:(id)sender {
//    [self.toastText resignFirstResponder];
    NSString *test = self.toastText.text;
    [NSToastView showToast:test duration:4.0f completion: ^{
        [NSToastView showToast:@"Toast Time OUT  :)" delay:0.5f];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return TRUE;
}
@end
