//
//  FruitView.h
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/18/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;

@interface FruitView : UIView

//@property (nonatomic, strong) Question *question;
//@property (nonatomic, strong) UIImageView *view;
- (id)initWithFrame:(CGRect)frame andQuestion: (Question*)question;

@end
