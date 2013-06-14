//
//  MoviePlayerViewController.m
//  MPMoviePlayer
//
//  Created by Thanh Dao on 5/28/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "MoviePlayerViewController.h"
#import<QuartzCore/QuartzCore.h>

CGFloat kMovieViewOffsetX = 20.0;
CGFloat kMovieViewOffsetY = 20.0;

@interface MoviePlayerViewController ()

@end

@implementation MoviePlayerViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //NSString *urlString = @"http://maxphim.vn:8081/Beautiful.Creatures.2013.720p.WEB-DL.X264-WEBiOS_clip1.mp4";
    //NSString *urlString = @"http://ia700408.us.archive.org/26/items/BigBuckBunny_328/BigBuckBunny_512kb.mp4";
    //NSString *urlString = @"https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8";
    //NSString *urlString = @"http://devimages.apple.com/samplecode/adDemo/ad.m3u8";
    //NSString *urlString = @"http://s2.maxphim.vn:1935/maxphim/mp4:Iron.Man.3.2013.HDRip.AACx264-52pdaHD_clip1/playlist.m3u8";
    //NSString *urlString =@"http://userpages.uni-koblenz.de/~thainguyen/Thanh/BigBuckBunny_512kb.mp4";
    //NSString *urlString = @"http://userpages.uni-koblenz.de/~thainguyen/Thanh/sample_withsubs.mp4";
    
    NSURL *theMovieURL = [NSURL URLWithString: urlString];
    //NSURL *theMovieURL = [[NSBundle mainBundle] URLForResource:@"BigBuckBunny_512kb" withExtension:@"mp4"];
    [self playMovieStream:theMovieURL];

    NSString *path = [[NSBundle mainBundle] pathForResource: @"Beautiful.Creatures.2013.720p.WEB-DL.X264-WEBiOS_clip1" ofType: @"srt"];
    self.subtitle = [[Subtitle alloc] init];
    self.view.frame = CGRectMake(0, 0, 320, 480);
    [self.subtitle subtitleWithPath: path];
}

//Check type stream and play
-(void)playMovieStream:(NSURL *)movieFileURL{
    MPMovieSourceType movieSourceType = MPMovieSourceTypeUnknown;
    
    /* If we have a streaming url then specify the movie source type. */
    if ([[movieFileURL pathExtension] compare:@"m3u8" options:NSCaseInsensitiveSearch] == NSOrderedSame)
    {
        //movieSourceType = MPMovieSourceTypeFile;
        movieSourceType = MPMovieSourceTypeStreaming;
    }
    [self createAndPlayMovieForURL:movieFileURL sourceType:movieSourceType];
}

-(void)createAndConfigurePlayerWithURL:(NSURL *)movieURL sourceType:(MPMovieSourceType)sourceType{
    /* Create a new movie player object. */
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: movieURL];
    
    if (self.moviePlayer)
    {
        /* Save the movie object. */
        //[self setMoviePlayerController:player];
        
        /* Register the current object as an observer for the movie
         notifications. */
        //[self installMovieNotificationObservers];
        
        /* Specify the URL that points to the movie file. */
        [self.moviePlayer setMovieSourceType:sourceType];
        [self.moviePlayer setContentURL:movieURL];
        
        /* If you specify the movie type before playing the movie it can result
         in faster load times. */
        
        /* Apply the user movie preference settings to the movie player object. */
        //[self applyUserSettingsToMoviePlayer];
        
        /* Add a background view as a subview to hide our other view controls
         underneath during movie playback. */
        //[self.view addSubview:self.backgroundView];
        
        //CGRect viewInsetRect = CGRectInset ([self.view bounds],
                                            //kMovieViewOffsetX,
                                            //kMovieViewOffsetY );
        /* Inset the movie frame in the parent view frame. */
        //self.moviePlayer.view.frame = self.view.bounds;
        
        [self.moviePlayer view].backgroundColor = [UIColor lightGrayColor];
        
        /* To present a movie in your application, incorporate the view contained
         in a movie player’s view property into your application’s view hierarchy.
         Be sure to size the frame correctly. */
        self.moviePlayer.view.frame = self.view.bounds;
        self.moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
        self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        self.moviePlayer.allowsAirPlay = YES;
        
        //Activity Indicator wait for loading
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
        self.activityIndicator.center = self.view.center;
        [self.activityIndicator startAnimating];

        [self.moviePlayer.view addSubview: self.activityIndicator];
        
       [self.view addSubview: self.moviePlayer.view];
    }
}

-(void)createAndPlayMovieForURL:(NSURL *)movieURL sourceType:(MPMovieSourceType)sourceType{
    [self createAndConfigurePlayerWithURL:movieURL sourceType:sourceType];
    
    // Create Label to display subtitle
    CGRect subFrame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
    self.subLabel = [[UILabel alloc] initWithFrame: subFrame];
    self.subLabel.backgroundColor = [UIColor clearColor];
    self.subLabel.textColor = [UIColor whiteColor];
    self.subLabel.textAlignment = UITextAlignmentCenter;
    self.subLabel.numberOfLines = 3;
    
    //self.subLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [self.moviePlayer.view addSubview: self.subLabel];
    
    // Add notification to catch full screen event.
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver: self
               selector: @selector(videoWillEnterFullScreen:)
                   name: MPMoviePlayerDidEnterFullscreenNotification
                 object: self.moviePlayer];
    [center addObserver: self
               selector: @selector(videoWillExitFullscreen:)
                   name: MPMoviePlayerDidExitFullscreenNotification
                 object: self.moviePlayer];
//    [center addObserver: self
//               selector: @selector(videoIsAirPlayVideoActive:)
//                   name: MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification
//                 object: self.moviePlayer];
     [[NSNotificationCenter defaultCenter]
             addObserver: self
                selector: @selector(readyForDisplay:)
                    name: MPMoviePlayerNowPlayingMovieDidChangeNotification
                  object: self.moviePlayer];

    [self.moviePlayer prepareToPlay];
    [self.moviePlayer play]; 
    
    _playerTimer = [NSTimer scheduledTimerWithTimeInterval: 1
                                                    target: self
                                                  selector: @selector(playSubtitle)
                                                  userInfo: nil
                                                   repeats: YES];
     
}

- (void)readyForDisplay:(NSNotification *)paramNotification{
    
    //if (_moviePlayer.readyForDisplay) {
        [_activityIndicator stopAnimating];
    //}
}

-(void)playSubtitle{
    
    NSTimeInterval currentTime = self.moviePlayer.currentPlaybackTime;
    
    int count = [self.subtitle.subtitleArray  count];
    int startIndex = 0;
    int endIndex = count;
    //int algorithm = 0;
    
    while (startIndex < endIndex) {
        
        //algorithm += 1;
        
        int midIndex = (startIndex + endIndex) / 2;
        id sub = [self.subtitle.subtitleArray objectAtIndex: midIndex];
        //NSTimeInterval startTime = [self startTimeOfSub: sub];
        NSTimeInterval endTime = [self endTimeOfSub: sub];
        
        if (currentTime > endTime) {
            startIndex = midIndex + 1;
        } else{
            endIndex = midIndex;
        }
    }
    if ((startIndex <= endIndex)) {
        id sub = [self.subtitle.subtitleArray objectAtIndex: startIndex];
        NSTimeInterval startTime = [self startTimeOfSub: sub];
        NSTimeInterval endTime = [self endTimeOfSub: sub];
        if (startTime <= currentTime <= endTime) {
            //NSLog(@"%f %f %f",startTime, currentTime, endTime);
            NSString *subText = [sub objectForKey: @"text"];
            self.subLabel.text = subText;
        }
    }
}

-(NSTimeInterval)startTimeOfSub:(NSDictionary *)sub{
    NSString  *startString = [sub objectForKey: @"start"] ;
    NSArray *startTimeArray = [startString componentsSeparatedByString:@":"];
    double hour = [[startTimeArray objectAtIndex: 0] floatValue];
    double minute = [[startTimeArray objectAtIndex: 1] floatValue];
    double second = [[startTimeArray objectAtIndex: 2] floatValue];
    NSTimeInterval startTime = hour * 3600 + minute * 60 + second;
    
    return startTime;
}

-(NSTimeInterval)endTimeOfSub: (NSDictionary *)sub{
    NSString *endString = [sub objectForKey: @"end"];
    NSArray *endTimeArray = [endString componentsSeparatedByString:@":"];
    double hour   = [[endTimeArray objectAtIndex: 0] floatValue];
    double minute = [[endTimeArray objectAtIndex: 1] floatValue];
    double second = [[endTimeArray objectAtIndex: 2] floatValue];
    NSTimeInterval endTime = hour * 3600 + minute * 60 + second;
    
    return endTime;
}

- (void)viewWillLayoutSubviews{
    self.moviePlayer.view.frame = self.view.bounds;
    
    //Set subtitle label frame
    CGRect bounds = self.view.bounds;
    
    CGRect subFrame = CGRectMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 4/5, bounds.size.width, bounds.size.height/5);
    NSLog(@"%f %f %f %f", subFrame.origin.x, subFrame.origin.y, subFrame.size.width, subFrame.size.height);
    self.subLabel.frame = subFrame;
    /*
    if (MU_DEVICE_ON_LANDSCAPE) {
        CGRect bounds = self.view.bounds;
        self.moviePlayer.view.frame = self.view.bounds;

        //CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y, self.view.bounds.size.height, self.view.bounds.size.width);
            //CGRect subFrame = CGRectMake(0, 200, 460, 80);

        //self.subLabel.frame = subFrame;
        //self.subLabel.center = CGPointMake(240, 240);

    }else{
        self.moviePlayer.view.frame = self.view.bounds;
        //self.subLabel.center = CGPointMake(160, 260);
    }
     */
}

-(void)videoWillEnterFullScreen:(NSNotification *)paramNotification{
    
    NSArray *windows = [[UIApplication sharedApplication] windows];
    NSLog(@"window number %@", windows);
    if ([windows count] > 1){
        UIWindow * moviePlayerWindow = [windows objectAtIndex:0];
        NSArray * subviews = [moviePlayerWindow subviews];
        UIView * videoView = [subviews objectAtIndex:0];
        [videoView addSubview: self.subLabel];
    }
}

-(void)videoWillExitFullscreen:(NSNotification *)paramNotification{
    NSArray *windows = [[UIApplication sharedApplication] windows];

    //if ([windows count] > 1){
        UIWindow * moviePlayerWindow = [windows objectAtIndex:0];
        NSArray * subviews = [moviePlayerWindow subviews];
        UIView * videoView = [subviews objectAtIndex:0];
        [videoView addSubview: self.subLabel];
    //}
}

-(void)videoIsAirPlayVideoActive:(NSNotification *)paramNotification{
    
//    //[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
//
//    NSArray *windows = [[UIApplication sharedApplication] windows];
//    if ([windows count] > 1){
//        UIWindow * moviePlayerWindow = [windows objectAtIndex:0];
//        NSArray * subviews = [moviePlayerWindow subviews];
//        UIView * videoView = [subviews objectAtIndex:0];
//        [videoView addSubview: self.subLabel];
//    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    //if ((toInterfaceOrientation == UIDeviceOrientationLandscapeLeft) || (toInterfaceOrientation == UIDeviceOrientationLandscapeRight)) {
        self.moviePlayer.view.frame = self.view.bounds;
    //}
    
    return YES;
}
 
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
