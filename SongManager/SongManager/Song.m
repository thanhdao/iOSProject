//
//  Song.m
//  SongManager
//
//  Created by iOS12 on 3/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "Song.h"

@implementation Song

- (id)initWithTitle: (NSString *)t
             singer: (NSString *)s
               year: (int)y
              genre: (NSString *)g{
    if(self = [super init]) {
        self.title = t;
        self.singer = s;
        self.year = y;
        self.genre = g;
    }
    return self;
}

- (NSString *)description {
    
   NSString *desc = [NSString stringWithFormat: @"Title: %@ Singer: %@ Year: %d Genre: %@", self.title, self.singer, self.year,self.genre ];
    return desc;
}

@end