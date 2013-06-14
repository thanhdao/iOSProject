//
//  ResultView.m
//  Fun Multiplications For Kids
//
//  Created by iOS 11 on 4/19/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ResultView.h"

@implementation ResultView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id) initWithScore:(NSInteger)score
            delegate:(id)delegate{
    if (self = [super init]) {
        _delegate = delegate;
        _score = score;
        self.frame = CGRectMake(20, 20, 280, 380);
        UILabel* scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 280, 30)];
        scoreLabel.text = [NSString stringWithFormat:@"Your total score: %d",score];
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        scoreLabel.backgroundColor = [UIColor clearColor];
        
        UILabel* messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 280, 50)];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.numberOfLines = 2;
        UIImageView *imageView;
        UIButton *nextLevelButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        if (score < PASS_SCORE) {
            imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"professor1.tif"]];
            messageLabel.text = @"Please try the level again and achieve more than 60 to promote to next level";
            
            UIButton *tryAgainButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
            CGRect tryAgainButtonFrame = CGRectMake(160, 200, 120, 40);
            CGPoint centerFrame = CGPointMake(160, 400);
            [tryAgainButton setTitle: @"Try Again" forState: UIControlStateNormal];
            tryAgainButton.frame = tryAgainButtonFrame;
            tryAgainButton.center = centerFrame;
            [self addSubview: tryAgainButton];
            [tryAgainButton addTarget: self.delegate
                                action: @selector(tryAgain:)
                      forControlEvents: UIControlEventTouchUpInside];

        } else{
            
            if (score == PERFECT_SCORE) {
                imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"professor2.tif"]];
                messageLabel.text = @" This is awsome! All your answers are correct";
            }
            else if (score >= PASS_SCORE) {
                imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"professor2.tif"]];
                messageLabel.text = @" Congratulations! You are promoted to next Level";
            }
            
            
            CGRect nextLevelButtonFrame = CGRectMake(160, 450, 120, 40);
            CGPoint centerFrame = CGPointMake(160, 430);
            [nextLevelButton setTitle: @"Next Level" forState: UIControlStateNormal];
            nextLevelButton.frame = nextLevelButtonFrame;
            nextLevelButton.center = centerFrame;
            [nextLevelButton addTarget: self
                               action: @selector(nextLevelDelegate:)
                      forControlEvents: UIControlEventTouchUpInside];
            NSLog(@"%d",nextLevelButton.enabled);
            /*
            UIGestureRecognizer *tap = [[UIGestureRecognizer alloc] initWithTarget: self action: @selector(nextLevel:)];
            [nextLevelButton addGestureRecognizer: tap];
            nextLevelButton.userInteractionEnabled = YES;
             */
            

        }
    imageView.frame = CGRectMake(65, 150, 150, 200);
    [self addSubview:imageView];
    [self addSubview:scoreLabel];
    [self addSubview:messageLabel];
    [self addSubview: nextLevelButton];
    [self setUserInteractionEnabled:YES];
    }
    return self;
}

- (void) nextLevelDelegate:(id)sender{
   
    [self.delegate nextLevel];
}

- (void)tryAgain:(id)sender{
    [self.delegate tryAgain];
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
