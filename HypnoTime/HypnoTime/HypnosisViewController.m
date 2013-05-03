//
//  HypnoTimeViewController.m
//  HypnoTime
//
//  Created by Thanh Dao on 4/5/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (id)init
{
    // Call the superclass's designated initializer
    self = [super initWithNibName: nil
                           bundle: nil];
    if (self) {
        // Get the tab bar item
        //UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        //[tbi setTitle: @"Hypnosis"];
        self.tabBarItem.title = @"Hypnosis";
        
        // Create a UIImage from a file
        
        
        // Put that image on the tab bar item
        self.tabBarItem.image = [UIImage imageNamed: @"Hypno.png"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Loaded the view for HypnosisViewController");
    
    // Set the background color of the view so we can see it
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)loadView
{
    HypnosisView *hv = [[HypnosisView alloc] initWithFrame: CGRectZero];
    [hv setBackgroundColor: [UIColor whiteColor]];
    [self setView: hv];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: animated];
    
    NSLog(@"Monitoring accelerometer");
    UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
    
    [a setUpdateInterval: 0.1];
    a.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    [[UIAccelerometer sharedAccelerometer] setDelegate: nil];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    NSLog(@"%f, %f, %f", [acceleration x ], [acceleration y],[acceleration z]);
}

@end
