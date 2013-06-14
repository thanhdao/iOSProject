//
//  SubtitleViewController.h
//  MPMoviePlayer
//
//  Created by Thanh Dao on 5/30/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubtitleViewController : UIViewController

//@property (nonatomic, strong) UIView *subtitleView;
@property (nonatomic, strong) UILabel *subLabel;

-(void)subtitleWithText:(NSString *)sub;

@end
