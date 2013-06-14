//
//  QuestionResultView.m
//  Fun Multiplications For Kids
//
//  Created by iOS 11 on 4/19/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "QuestionResultView.h"
@interface QuestionResultView(){
    
}

@end
@implementation QuestionResultView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id) initWithFrame:(CGRect)frame
    andAnswerCorrect:(BOOL)correct{
    if (self = [super initWithFrame: frame]) {
       
        self.correct = correct;
        self.contentMode = UIViewContentModeScaleAspectFit;
        //NSError *error;
        NSString *soundFilePath;
        if (correct) {
            self.image = [UIImage imageNamed:@"Correct.png"];
            soundFilePath = [[NSBundle mainBundle]pathForResource:@"Clapping" ofType:@"wav"];
        }
        else {
            self.image = [UIImage imageNamed:@"Wrong.png"];
            soundFilePath = [[NSBundle mainBundle]pathForResource:@"Ohh" ofType:@"wav" ];
        }
        //self.checkAnswerSound = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath: soundFilePath] error:&error];
        //if (self.checkAnswerSound != nil){
        //   [self.checkAnswerSound play];
        //}

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

@end
