//
//  ViewController.h
//  MPPlayer
//
//  Created by Thanh Dao on 6/6/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property (strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end
