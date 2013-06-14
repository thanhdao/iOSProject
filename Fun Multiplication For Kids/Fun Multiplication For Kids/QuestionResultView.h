//
//  QuestionResultView.h
//  Fun Multiplications For Kids
//
//  Created by iOS 11 on 4/19/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface QuestionResultView : UIImageView

@property (nonatomic) BOOL correct;
@property (nonatomic, strong) AVAudioPlayer *checkAnswerSound;

- (id) initWithFrame:(CGRect)frame
    andAnswerCorrect:(BOOL)correct;

@end
