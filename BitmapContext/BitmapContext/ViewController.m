//
//  ViewController.m
//  BitmapContext
//
//  Created by Thanh Dao on 5/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"
#import "BitmapView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BitmapView *bitmapView = [[BitmapView alloc] initWithFrame: self.view.bounds];
    [self.view addSubview: bitmapView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
