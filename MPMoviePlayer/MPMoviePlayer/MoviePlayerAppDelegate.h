//
//  MoviePlayerAppDelegate.h
//  MPMoviePlayer
//
//  Created by Thanh Dao on 5/28/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MoviePlayerViewController;

@interface MoviePlayerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *secondWindow;

@property (strong, nonatomic) MoviePlayerViewController *viewController;

@end
