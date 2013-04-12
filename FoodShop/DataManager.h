//
//  DataManager.h
//  FoodShop
//
//  Created by Thanh Dao on 4/12/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic, strong) NSMutableArray *playerList;

+ (id)sharedManager;

@end
