//
//  ViewController.m
//  DrawingBasics
//
//  Created by Thanh Dao on 5/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DrawView *drawView = [[DrawView alloc] initWithFrame: self.view.bounds];
    [self.view addSubview: drawView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
