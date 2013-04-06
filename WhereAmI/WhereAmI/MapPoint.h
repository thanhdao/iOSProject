//
//  MapPoint.h
//  WhereAmI
//
//  Created by Thanh Dao on 4/1/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject<MKAnnotation>
{
    NSString *_title;
   CLLocationCoordinate2D _coordinate;
    NSDate *_date;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

// A new designated initializer for instance of MapPoint
- (id)initWithCoordinate: (CLLocationCoordinate2D)c title: (NSString *)t;


@end
