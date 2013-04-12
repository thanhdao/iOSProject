//
//  ViewController.h
//  UserInput
//
//  Created by Thanh Dao on 4/10/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController//<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)onDismissKeyBoard:(id)sender;
- (IBAction)signIn:(id)sender;

@end
