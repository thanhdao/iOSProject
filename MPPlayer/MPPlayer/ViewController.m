//
//  ViewController.m
//  MPPlayer
//
//  Created by Thanh Dao on 6/6/13.
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
    // Do any additional setup after loading the view, typically from a nib.
    //NSString *urlString = @"http://maxphim.vn:8081/Beautiful.Creatures.2013.720p.WEB-DL.X264-WEBiOS_clip1.mp4";
    NSString *urlString = @"http://ia700408.us.archive.org/26/items/BigBuckBunny_328/BigBuckBunny_512kb.mp4";
    //NSString *urlString = @"https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8";
    //NSString *urlString = @"http://devimages.apple.com/samplecode/adDemo/ad.m3u8";
    //NSString *urlString = @"http://s2.maxphim.vn:1935/maxphim/mp4:Iron.Man.3.2013.HDRip.AACx264-52pdaHD_clip1/playlist.m3u8";
    //NSString *urlString =@"http://userpages.uni-koblenz.de/~thainguyen/Thanh/BigBuckBunny_512kb.mp4";
    //NSString *urlString = @"http://userpages.uni-koblenz.de/~thainguyen/Thanh/sample_withsubs.mp4";
    
    //NSURL *movieURL = [NSURL URLWithString: urlString];
    NSURL *movieURL = [[NSBundle mainBundle] URLForResource:@"BigBuckBunny_512kb" withExtension:@"mp4"];
    
    MPMovieSourceType movieSourceType = MPMovieSourceTypeUnknown;
    
    if ([[movieURL pathExtension] compare:@"m3u8" options:NSCaseInsensitiveSearch] == NSOrderedSame)
    {
        //movieSourceType = MPMovieSourceTypeFile;
        //movieSourceType = MPMovieSourceTypeStreaming;
    }
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: movieURL];
    if (self.moviePlayer) {
        [self.moviePlayer setMovieSourceType: movieSourceType];
        [self.moviePlayer setContentURL: movieURL];
        [self.moviePlayer view].backgroundColor = [UIColor lightGrayColor];
        self.moviePlayer.view.frame = self.view.bounds;
        self.moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
        self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        self.moviePlayer.allowsAirPlay = YES;
        
        //Activity Indicator wait for loading
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
        self.activityIndicator.center = self.view.center;
        [self.activityIndicator startAnimating];
        
        //UILabel *lab
        [self.moviePlayer.view addSubview: self.activityIndicator];
        
        [self.view addSubview: self.moviePlayer.view];
        [[NSNotificationCenter defaultCenter]
         addObserver: self
         selector: @selector(nowPlay:)
         name: MPMoviePlayerNowPlayingMovieDidChangeNotification
         object: self.moviePlayer];
        
        [self.moviePlayer prepareToPlay];
        [self.moviePlayer play];

    }

}

- (void)nowPlay:(NSNotification *)paramNotification{
    
    //if (_moviePlayer.readyForDisplay) {
    [_activityIndicator stopAnimating];
    //}
}

- (void)viewWillLayoutSubviews{
    self.moviePlayer.view.frame = self.view.bounds;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
