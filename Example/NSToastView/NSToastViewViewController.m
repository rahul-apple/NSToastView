//
//  NSToastViewViewController.m
//  NSToastView
//
//  Created by rahul-apple on 08/19/2015.
//  Copyright (c) 2015 rahul-apple. All rights reserved.
//

#import "NSToastViewViewController.h"
#import "NSToastView.h"
@interface NSToastViewViewController ()

@end

@implementation NSToastViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toastIt:(id)sender {
//    [self.toastText resignFirstResponder];
    NSString *test = self.toastText.text;
    [NSToastView nsShowToast:test duration:4.0f completion: ^{
        [NSToastView nsShowToast:@"Toast Time OUT  :)" delay:0.5f];
    }];
}
@end
