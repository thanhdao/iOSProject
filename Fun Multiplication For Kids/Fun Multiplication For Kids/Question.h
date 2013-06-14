//
//  Question.h
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/17/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <Foundation/Foundation.h>


//#define RESULT_NUM 3

@interface Question : NSObject
{
//    int _result[RESULT_NUM];
}
@property(assign) int operandOne;
@property(assign) int operandTwo;
@property(nonatomic, strong) NSMutableArray *operandTwoArray;
@property(nonatomic, strong) NSMutableArray *operandTwoImageArray;

@property(nonatomic, strong) NSMutableArray *resultArray;

@property(assign) int result;
@property(assign) int questionScore;
@property(assign) int questionNum;

@property(nonatomic, strong) UIImage *operandOneImage;
@property(nonatomic, strong) UIImage *operandTwoImage;
@property(nonatomic, strong) UIButton *resultButton;
@property(nonatomic, strong) UIImageView *correctView;
@property(nonatomic, strong) UIImageView *wrongView;
@property(nonatomic, strong) UIButton *nextQuestion;

- (id)initWithQuestionAtLevel: (int)operand;
    

@end
