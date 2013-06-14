//
//  Subtitle.h
//  MoviePlayer
//
//  Created by Thanh Dao on 5/27/13.
//
//

#import <Foundation/Foundation.h>

@interface Subtitle : NSObject
@property (nonatomic, strong) NSMutableArray *subtitleArray;
-(void)subtitleWithPath: (NSString *)path;
@end
