//
//  Possession.m
//  RandomPossessions
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "Possession.h"

@implementation Possession

+ (id)randomPossession{
    // Create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                    @"Rusty",
                                    @"Shiny", nil];
    // Create an array of three nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",
                               @"Spork",
                               @"Mac", nil];
    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a random number
    // from 0 to 2 inclusive.
    int adjectiveIndex = rand() % [randomAdjectiveList count];
    int nounIndex = rand() % [randomNounList count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    int randomValue = rand() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    // Once again, ignore the memory problems with this method
    Possession *newPossession =
    [[[self alloc] initWithPossessionName: randomName
                          valueInDollars: randomValue
                            serialNumber: randomSerialNumber] autorelease];
     return newPossession;
}

- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber{
    // Call the superclass's designated initializer
    if (self = [super init]){
    // Give the instance variables initial values
    [self setPossessionName:name];
    [self setSerialNumber:sNumber];
    [self setValueInDollars:value];
    _dateCreated = [[NSDate alloc] init];
    }
    // Return the address of the newly initialized object
    return self;
}

- (id)init {
    return [self initWithPossessionName:@"Possession"
                         valueInDollars:0
                           serialNumber:@""];
}

// Getter
- (NSString *)possessionName
{
    // Return a pointer to the object this Possession calls its possessionName
    return _possessionName;
}
// Setter
- (void)setPossessionName:(NSString *)newPossessionName
{
    // Change the instance variable to point at another string,
    // this Possession will now call this new string its possessionName
    
    [newPossessionName retain];
    _possessionName = newPossessionName;
}

- (void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
    
}
- (NSString *)serialNumber
{
    return _serialNumber;
}
- (void)setValueInDollars:(int)i
{
    _valueInDollars = i;
}
- (int)valueInDollars
{
    return _valueInDollars;
}
- (NSDate *)dateCreated
{
    return _dateCreated;
}

- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
     _possessionName,
     _serialNumber,
     _valueInDollars,
     _dateCreated];
    return [descriptionString autorelease];
}

@end