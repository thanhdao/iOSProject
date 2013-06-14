//
//  FruitViewCell.h
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/18/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FruitViewCell : UIView

//@property(nonatomic, strong) UIImageView *view;

- (id)initWithFrame: (CGRect)frame
  withNumberOfImage: (int)imageNumber
           andImage: (UIImage*)image;

@end
