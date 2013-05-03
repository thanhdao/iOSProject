//
//  EggWindow.m
//  BreakingEgg
//
//  Created by Thanh Dao on 3/28/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "EggWindow.h"

@implementation EggWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
// Hứng sự kiện lắc
- (void) motionEnded: (UIEventSubtype)motion
           withEvent: (UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Detected a shake");
        // TRuyền Notification khi có sự kiện lắc.
        [[NSNotificationCenter defaultCenter]
         postNotificationName: @"shake"
                       object: self];
    }
}

@end
