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
              album: (NSString *)al
             singer: (NSString *)s
               year: (int)y
              genre: (NSString *)g
              albumImage: (UIImage *)img
{
    if(self = [super init]) {
        self.title = t;
        self.album = al;
        self.singer = s;
        self.year = y;
        self.genre = g;
        self.albumImage = img;
    }
    return self;
}

- (NSString *)description {
    
    NSString *desc = [NSString stringWithFormat: @"Title: %@ Album: %@ Singer: %@ Year: %d Genre: %@", self.title,self.album, self.singer, self.year,self.genre ];
    return desc;
}

@end
