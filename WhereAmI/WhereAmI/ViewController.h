//
//  ViewController.h
//  WhereAmI
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapPoint.h"

@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}
- (void)findLocation;
- (void)foundLocation: (CLLocation *)loc;

@end
