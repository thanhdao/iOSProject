//
//  GameViewController.h
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultView.h"
#import "QuestionResultView.h"
#import "Question.h"
#import <AVFoundation/AVFoundation.h>

//@class Question;
@class FruitView;

@interface GameViewController : UIViewController<AVAudioPlayerDelegate>

@property (assign) int level;
@property (nonatomic, strong) Question *question;
@property (nonatomic, strong) NSMutableArray *levelScoreArray;

- (void)generateQuestion;

@end
