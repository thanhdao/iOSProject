//
//  Song.h
//  SongManager
//
//  Created by iOS12 on 3/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *singer;
@property (assign)                int year;
@property (nonatomic,strong) NSString *genre;

- (id)initWithTitle: (NSString *)title
             singer: (NSString *)singer
               year: (int)year
              genre: (NSString *)genre;



@end
