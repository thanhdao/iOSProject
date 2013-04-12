//
//  ViewController.m
//  ActionSheet
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
    UIActionSheet *message = [[UIActionSheet alloc] initWithTitle: @"This is the Action Sheet"
                                                         delegate: self
                                                cancelButtonTitle: @"Cancel" destructiveButtonTitle: @"Destructive" otherButtonTitles: @"Other1",@"Other2",@"Other3", nil];
    [message showInView: self.view];
}

- (void)actionSheet: (UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        
        NSLog(@"Cancel Button");
        
    } else if(buttonIndex == actionSheet.destructiveButtonIndex){
        
        NSLog(@"Destructive Button");
    } else if(buttonIndex == actionSheet.firstOtherButtonIndex){
        
        NSLog(@"First Other Button");
    } else if(buttonIndex == actionSheet.firstOtherButtonIndex + 1){
        
        NSLog(@"First Other Button + 1");
     }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
