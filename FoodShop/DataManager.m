//
//  DataManager.m
//  FoodShop
//
//  Created by Thanh Dao on 4/12/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "DataManager.h"
#import "Player.h"

@implementation DataManager {
    NSMutableArray *_allPlayers;
}

- (id)init {
    if (self = [super init]) {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource: @"players" ofType:@"plist"];
        _allPlayers = [[NSMutableArray alloc] initWithContentsOfFile: dataPath];
        self.playerList = [[NSMutableArray alloc] init];
    }
    for (NSDictionary *p in _allPlayers) {
        Player *player = [[Player alloc] init];
        player.name = [p objectForKey: @"Name"];
        player.photo = [p objectForKey: @"Photo"];
        player.description = [p objectForKey: @"Description"];
        
        [self.playerList addObject: player];

    }
    return self;
    
}

+ (id)sharedManager {
    
    static DataManager *sharedDataManager = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        sharedDataManager = [self new];
    });
    return sharedDataManager;
}

@end
