//
//  ViewController.m
//  QuizView
//
//  Created by iOS12 on 3/25/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _question = [[NSMutableArray alloc] init];
    _answer = [[NSMutableArray alloc] init];
    
    [_question addObject: @"What is 8 + 9"];
    [_answer addObject: @"17"];
    
    [_question addObject: @"Who is the best football player"];
    [_answer addObject: @"Messi"];
    
    [_question addObject: @"Who is the people of year"];
    [_answer addObject: @"Steve Jobs"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
    
    _currentQuestionIndex = arc4random() % [_question count];
    NSString *question = [_question objectAtIndex: _currentQuestionIndex];
    [self.questionField setText: question];
    
    [self.answerField setText: @"???"];
}

- (IBAction)showAnswer:(id)sender {
    
    NSString *answer = [_answer objectAtIndex: _currentQuestionIndex];
    
    [self.answerField setText: answer];
}
@end
