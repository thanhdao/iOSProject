//
//  main.m
//  RandomPossessions
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Possession.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        /*
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        [items insertObject:@"Zero" atIndex:0];
        NSLog(@"%@", p);
         */
        for (int i = 0; i < 10; i++) {
            Possession *p = [Possession randomPossession];
            [items addObject:p];
        }
        for(Possession *item in items) {
            
            //[item setPossessionName: @"You"];
            NSLog(@"%@", item);
        }
       
        NSMutableString *str = [[NSMutableString alloc] initWithString:@"White Sofa"];
        // This is okay, as NSMutableString is a NSString since it is a subclass
        [[items objectAtIndex: 0] setPossessionName:str];
        NSLog(@"%@", [items objectAtIndex: 0]);

        [str appendString:@" - Stained"];
        // possession's name is now "White Sofa - Stained"
        NSLog(@"%@", [items objectAtIndex: 0]);
    }
    return 0;
}

