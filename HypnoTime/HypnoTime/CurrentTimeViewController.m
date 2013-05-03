//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by Thanh Dao on 4/5/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "CurrentTimeViewController.h"

@implementation CurrentTimeViewController

- (id)init
{
    // Call the superclass's designated initializer
    //NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName: @"CurrentTimeViewController"
                           bundle: nil];
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        tbi.title = @"Time";
        
        UIImage *i = [UIImage  imageNamed: @"Time.png"];
        [tbi setImage: i];
        [[self view] setBackgroundColor: [UIColor yellowColor]];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    // Disregard parameters - implementation detail
    return [self init];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSLog(@"Loaded the view for CurrentTimeViewController");
    
    // Set the background color of the view so we can see it
    //self.view.backgroundColor = [UIColor greenColor];
}

- (IBAction)showCurrentTime:(id)sender{
    
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"hh:mm:ss"];
        _timeLabel.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate: now ]];


}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will appear");
    [super  viewWillAppear: animated];
    [self showCurrentTime: nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will Disappear");
    [super viewWillDisappear: animated];
}

@end
