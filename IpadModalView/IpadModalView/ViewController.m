//
//  ViewController.m
//  IpadModalView
//
//  Created by Thanh Dao on 4/7/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
- (IBAction)seconViewController:(id)sender {
    SecondViewController *secondVC  = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self presentViewController:secondVC animated:YES completion:^{
        NSLog(@"Presented View Controller is %@", self.presentedViewController);
    }];

}

@end
