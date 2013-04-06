//
//  AppDelegate.h
//  Hypernosis
//
//  Created by Thanh Dao on 4/4/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

// This is a "forward declaration"
@class HypnosisView;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisView *_view;
}
@property (strong, nonatomic) UIWindow *window;

@end
