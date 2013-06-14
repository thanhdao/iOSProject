//
//  MoviePlayerViewController.h
//  MPMoviePlayer
//
//  Created by Thanh Dao on 5/28/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Subtitle.h"
#import "SubtitleViewController.h"

@interface MoviePlayerViewController : UIViewController
{
@private
//    MPMoviePlayerController *moviePlayerController;
    
//    IBOutlet MoviePlayerAppDelegate *appDelegate;
    
//	IBOutlet MyImageView *imageView;
//	IBOutlet UIImageView *movieBackgroundImageView;
//	IBOutlet UIView *backgroundView;
//	IBOutlet MyOverlayViewController *overlayController;
}

//@property (nonatomic, retain) IBOutlet MyImageView *imageView;
//@property (nonatomic, retain) IBOutlet UIImageView *movieBackgroundImageView;
//@property (nonatomic, retain) IBOutlet UIView *backgroundView;
//@property (nonatomic, retain) IBOutlet MyOverlayViewController *overlayController;
//@property (nonatomic, retain) IBOutlet MoviePlayerAppDelegate *appDelegate;

@property (strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) NSTimer *playerTimer;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (assign) float time;
@property (assign) int indexSubLine;
@property (nonatomic, strong) Subtitle *subtitle;
@property (nonatomic, strong) UILabel *subLabel;

//- (IBAction)overlayViewCloseButtonPress:(id)sender;
//- (void)viewWillEnterForeground;
//- (void)playMovieFile:(NSURL *)movieFileURL;
- (void)playMovieStream:(NSURL *)movieFileURL;

@end
