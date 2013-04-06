//
//  CurrentTimeViewController.h
//  HypnoTime
//
//  Created by Thanh Dao on 4/5/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentTimeViewController : UIViewController
{
    IBOutlet UILabel *_timeLabel;
}

- (IBAction)showCurrentTime:(id)sender;

@end
