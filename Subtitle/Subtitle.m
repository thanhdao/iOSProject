//
//  Subtitle.m
//  MoviePlayer
//
//  Created by Thanh Dao on 5/27/13.
//
//

#import "Subtitle.h"

@implementation Subtitle

- (void)subtitleWithPath:(NSString *)path{
    //path = [[NSBundle mainBundle] pathForResource:@"Movie" ofType:@"srt"];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    //NSMutableArray *subtitleArray = [[NSMutableArray alloc] init];
    while (![scanner isAtEnd])
    {
            NSString *indexString;
            (void) [scanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&indexString];
            
            NSString *startString;
            (void) [scanner scanUpToString:@" --> " intoString:&startString];
            
            // My string constant doesn't begin with spaces because scanners
            // skip spaces and newlines by default.
            (void) [scanner scanString:@"-->" intoString:NULL];
            
            NSString *endString;
            (void) [scanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&endString];
            
            NSString *textString;
            // (void) [scanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&textString];
            // BEGIN EDIT
            (void) [scanner scanUpToString:@"\r\n\r\n" intoString:&textString];
            textString = [textString stringByReplacingOccurrencesOfString:@"\r\n" withString:@" "];
            // Addresses trailing space added if CRLF is on a line by itself at the end of the SRT file
            textString = [textString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            // END EDIT
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        indexString, @"index",
                                        startString, @"start",
                                        endString , @"end",
                                        textString , @"text",
                                        nil];
        [_subtitleArray addObject: dictionary];
            NSLog(@"%@", dictionary);
        }
    
    //return subtitleArray;
}

@end
