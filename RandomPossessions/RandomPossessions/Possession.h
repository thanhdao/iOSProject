//
//  Possession.h
//  RandomPossessions
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject
{
    /*
    NSString *_possessionName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
  */
}
@property (nonatomic, retain) NSString *possessionName;
@property (nonatomic, retain) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;
+ (id)randomPossession;

- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber;

- (NSString *)possessionName;
- (void)setPossessionName:(NSString *)newPossessionName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)i;
- (int)valueInDollars;

- (NSDate *)dateCreated;
@end
