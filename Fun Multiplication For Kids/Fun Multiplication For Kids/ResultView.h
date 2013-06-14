//
//  ResultView.h
//  Fun Multiplications For Kids
//
//  Created by iOS 11 on 4/19/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define PERFECT_SCORE 100
#define PASS_SCORE 60

@protocol ResultViewDelegate <NSObject>

@required
- (void) tryAgain;
- (void) nextLevel;

@end

@interface ResultView : UIView

//  If score is lower than PASS_SCORE player can come to next level, else try again. If socre = PERFECT_SCORE (all answears are true) a trophy is displayed
@property (nonatomic) NSInteger score;

//  delegate should implement ResultViewDelegate
@property (nonatomic,weak) id <ResultViewDelegate> delegate;

- (id) initWithScore: (NSInteger) score
            delegate: (id) delegate;
@end
