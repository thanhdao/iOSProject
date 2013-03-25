//
//  ViewController.h
//  QuizView
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
int _currentQuestionIndex;
NSMutableArray *_question;
NSMutableArray *_answer;
}
@property (nonatomic, strong) IBOutlet UILabel *questionField;
@property (nonatomic, strong) IBOutlet UILabel *answerField;

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;

@end
