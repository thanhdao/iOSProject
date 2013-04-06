//
//  MapPoint.m
//  WhereAmI
//
//  Created by Thanh Dao on 4/1/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t{
    
    if (self = [super init]) {
        _coordinate = c;
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd-MM-YYYY"];
        _date = [NSDate date];
        _title = [NSString stringWithFormat:@"%@ : %@",t,[dateFormat stringFromDate: _date ]];
    }
    return  self;
}

@end
