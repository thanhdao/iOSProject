//
//  AppDelegate.m
//  Hypernosis
//
//  Created by Thanh Dao on 4/4/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@implementation AppDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _view;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    // Make a CGRect that is the size of the window
    CGRect wholeWindow = [[self  window]  bounds];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: wholeWindow];
    [[self window] addSubview: scrollView];
    
    // Make your view twice as large as the window
    CGRect reallyBigRect;
    reallyBigRect.origin = CGPointZero;
    reallyBigRect.size.width = wholeWindow.size.width * 2.0;
    reallyBigRect.size.height = wholeWindow.size.height * 2.0;
    [scrollView setContentSize: reallyBigRect.size];
    
    // Center it in the scroll view
    
    CGPoint offset;
    offset.x = wholeWindow.size.width * 0.5;
    offset.y = wholeWindow.size.height * 0.5;
    
    [scrollView setContentOffset: offset];
    
    // Enable zooming
    [scrollView setMinimumZoomScale: 0.5];
    [scrollView setMaximumZoomScale: 5];
    [scrollView setDelegate: self];

    
    // Create the view
    _view = [[HypnosisView alloc] initWithFrame: reallyBigRect];
    [_view setBackgroundColor: [UIColor clearColor]];
    [scrollView addSubview: _view];
    
    /*
    [[UIApplication sharedApplication] setStatusBarHidden: YES
                                            withAnimation: UIStatusBarAnimationFade];
     */
    
    /*
    // Create an instance of HypnosisView that is the same size as the window
    _view = [[HypnosisView alloc] initWithFrame: wholeWindow];
 
    
    // Set the background color of that view to "clear"
    [_view setBackgroundColor: [UIColor clearColor]];
    
    // Add the view to the view hierarchy so that it appears on the window
     */
    //[[self window] addSubview: _view];

    // Add the view to the view hierachy
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end