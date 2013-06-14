//
//  SubtitleViewController.m
//  MPMoviePlayer
//
//  Created by Thanh Dao on 5/30/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "SubtitleViewController.h"

@interface SubtitleViewController ()

@end

@implementation SubtitleViewController
@synthesize  subLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGRect viewFrame = self.view.bounds;
        //self.subtitleView = [[UIView alloc] initWithFrame: viewFrame];
        //[self.view addSubview: self.subtitleView];
        self.subLabel = [[UILabel alloc] initWithFrame: viewFrame];
        self.subLabel.backgroundColor = [UIColor clearColor];
        self.subLabel.textColor = [UIColor whiteColor];
        self.subLabel.textAlignment = UITextAlignmentCenter;
        self.subLabel.numberOfLines = 4;
        
        [self.view addSubview: self.subLabel];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}
-(void)subtitleWithText:(NSString *)sub{
    self.subLabel.text = sub;
    [self.view addSubview: self.subLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
