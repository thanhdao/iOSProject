//
//  Question.m
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/17/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "Question.h"


@implementation Question
{
}
- (id)initWithQuestionAtLevel: (int)operand {
    if (self = [super init]) {
       self.questionScore = 10;
       self.operandOne    = operand;
        
        _operandTwoArray = [[NSMutableArray alloc] init];
        for (int i = 1; i <= TIME_TABLE_SIZE; i++) {
            [_operandTwoArray addObject: [NSNumber numberWithInt: i]];
        }
        
        // Random operand Two
        int index;
        for (int i = 0; i < TIME_TABLE_SIZE; i++) {
            index = arc4random() % TIME_TABLE_SIZE;
            [_operandTwoArray exchangeObjectAtIndex: i withObjectAtIndex: index];
        }
        // Create operand Image
        //self.operandOneImage = [UIImage imageNamed: @"Dish.png"];
        NSString *dataPath   = [[NSBundle mainBundle] pathForResource: @"Fruit"
                                                               ofType: @"plist"];
        _operandTwoImageArray = [[NSMutableArray alloc] initWithContentsOfFile: dataPath];
        int count = [_operandTwoImageArray count];
        for (int i = 0; i < count   ; i++) {
            index = arc4random() % count;
            [_operandTwoImageArray exchangeObjectAtIndex: i withObjectAtIndex: index];

        }
        //int imageIndex       = arc4random() % [_operandTwoImageArray count];
        //NSString *s = [_operandTwoImageArray objectAtIndex: imageIndex];
        //self.operandTwoImage = [UIImage imageNamed: s];
    }
    return self;
}


@end
