//
//  ViewController.m
//  Quartz
//
//  Created by Thanh Dao on 5/8/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.demoView = [[DemoView alloc] initWithFrame: self.view.bounds];
    [self.view addSubview: self.demoView];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
