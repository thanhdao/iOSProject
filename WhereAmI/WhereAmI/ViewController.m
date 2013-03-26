//
//  ViewController.m
//  WhereAmI
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Create location manager object
    locationManager = [[CLLocationManager alloc] init];
    
    // We want all results from the location manager
    [locationManager setDistanceFilter: kCLDistanceFilterNone];
    
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [locationManager startUpdatingLocation];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
