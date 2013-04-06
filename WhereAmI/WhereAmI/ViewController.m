//
//  ViewController.m
//  WhereAmI
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (nonatomic, strong)NSString *locationPlace;
@property (nonatomic, strong) MKPlacemark *placemark;
@property (nonatomic, strong) CLGeocoder *geocoder ;
//@property (nonatomic, strong) NSArray *placemarks ;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Create location manager object
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate: self];
    
    
    // We want all results from the location manager
    //[locationManager setDistanceFilter: kCLDistanceFilterNone];
    
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    /*
    [locationManager startUpdatingLocation];
    if ([CLLocationManager headingAvailable] == NO) {
        
        NSLog(@"No Compass. This device does not have the ability to measure magnetic fields.");
    }else{
        
        locationManager.headingFilter = 5;
        
        [locationManager startUpdatingHeading];
    }
     */
    _geocoder = [[CLGeocoder alloc] init] ;
    //_placemark = [[MKPlacemark alloc] initWith];

    [worldView setShowsUserLocation: YES];
  
   
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion: region animated: YES];
    NSLog(@"%@",self.placemark);
}

- (void)findLocation{
    [locationManager startUpdatingLocation];
    [activityIndicator  startAnimating];
    [locationTitleField setHidden: YES];
}


- (void)foundLocation: (CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];

    
    
    [self.geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
        if (error){
            NSLog(@"Geocode failed with error: %@", error);
            //[self displayError:error];
            return;
        }
        //NSLog(@"Received placemarks: %@", [placemarks objectAtIndex: 0]);
        //self.locationPlace = [NSString stringWithFormat:@"%@ %@",[locationTitleField text], placemarks];
       self.placemark = [placemarks objectAtIndex: 0];
        NSLog(@"%@",self.placemark);
        //_placemark = [[MKPlacemark alloc] initWithPlacemark:[placemarks objectAtIndex: 0]];
         //NSLog(@"%@",_placemark);
        
        //[self displayPlacemarks:placemarks];
    }];
   
    //NSError *error;
    //[_geocoder reverseGeocodeLocation:loc completionHandler:CLGeocodeCompletionHandler(self.placemarks, &error);


    
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate: coord title: [locationTitleField text]];
    //NSLog(@"%@",self.placemark);
    [worldView addAnnotation:mp];
    
    
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion: region
                animated: YES];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden: NO];
    [locationManager stopUpdatingLocation];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    // Sau bao nhieu giay thi vi tri moi duoc tao
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    // CLLocation Managers se tra ve vi tri cuoi cung duoc tim thay cua thiet bi truoc, bo qua du lieu nay
    // Neu vi tri duoc tao truoc 3 phut thi bo qua
    if (t < -180) {
        return;
    }
    
    [self foundLocation: newLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}
 

/*
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"%@", newHeading);
}
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    //NSLog(@"%@",self.placemark);
    // Tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}
@end
