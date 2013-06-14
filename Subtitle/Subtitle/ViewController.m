//
//  ViewController.m
//  Subtitle
//
//  Created by Thanh Dao on 5/27/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Subtitle *subtitle = [[Subtitle alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Movie" ofType:@"srt"];
    //NSMutableArray *subtitleArray = [[NSMutableArray alloc] init];
    //subtitleArray = [subtitle subtitleWithPath: path];
    [subtitle subtitleWithPath: path];
    for (id sub in subtitle.subtitleArray) {
        NSLog(@"%@", sub);
    }
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
