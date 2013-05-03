//
//  HeavyRotationViewController.m
//  Rotation
//
//  Created by Thanh Dao on 4/13/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "HeavyRotationViewController.h"

@interface HeavyRotationViewController ()

@end

@implementation HeavyRotationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    UIColor *color = nil;
    CGRect bounds = self.view.bounds;
    
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        [self.leftButton setCenter: CGPointMake(bounds.size.width - 250,300)];
        color = [UIColor redColor];
    } else {
        self.leftButton.center = CGPointMake(bounds.size.width - 300, bounds.size.height - 20);
        color = [UIColor blueColor];
    }
    self.view.backgroundColor = color;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
