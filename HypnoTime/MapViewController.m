//
//  MapViewController.m
//  HypnoTime
//
//  Created by Thanh Dao on 4/9/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property (nonatomic, strong) CLGeocoder *geocoder ;

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.title = @"Map";
        //UIImage *i = [UIImage  imageNamed: @"map_icon.gif"];
        self.tabBarItem.image = [UIImage imageNamed: @"map_icon.gif"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate: self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    _geocoder = [[CLGeocoder alloc] init] ;
     [worldView setShowsUserLocation: YES];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion: region animated: YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
