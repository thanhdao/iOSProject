//
//  ViewController.m
//  UserInput
//
//  Created by Thanh Dao on 4/10/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                    action: @selector(handleBackGroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer: tapRecognizer];
    
}

- (void)handleBackGroundTap: (UITapGestureRecognizer *)sender {
    [self.userNameTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDismissKeyBoard:(id)sender {
    
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (IBAction)signIn:(id)sender {
    
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
    NSString *userName = self.userNameTextField.text;
    int length = [userName length];
    
    if (length == 0) {
        return;
    }
    
    NSString *alertViewMessage = [NSString stringWithFormat: @"Welcome %@",userName];
    
    UIAlertView *welcomeMessage = [[UIAlertView alloc] initWithTitle: @"Login success"
                                                             message:alertViewMessage delegate: self cancelButtonTitle: @"OK" otherButtonTitles: @"buttonOne", @"buttonTwo", nil];
    //welcomeMessage.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [welcomeMessage show];
}

- (void)alertView: (UIAlertView *)alertView
clickedButtonAtIndex: (NSInteger)buttonIndex{
    
    //UITextField *field1 = [alertView textFieldAtIndex: 0];
    if (buttonIndex == alertView.cancelButtonIndex) {
        NSLog(@" cancel Button ");
    } else if (buttonIndex == alertView.firstOtherButtonIndex) {
        
        NSLog(@"firstOtherButtonIndex");

    } else if (buttonIndex == alertView.firstOtherButtonIndex + 1){
        NSLog(@"Second OtherButtonIndex");
    }
}

@end
