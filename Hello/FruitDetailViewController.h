//
//  FruitDetailViewController.h
//  Hello
//
//  Created by Thanh Dao on 4/9/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FruitClass.h"

@interface FruitDetailViewController : UIViewController

@property (strong, nonatomic) FruitClass* dataObject;
@property (weak, nonatomic) IBOutlet UIImageView *fruitImage;
@property (weak, nonatomic) IBOutlet UILabel *fruitName;
@property (weak, nonatomic) IBOutlet UILabel *fruitFamily;
@property (weak, nonatomic) IBOutlet UILabel *fruitGenus;
- (IBAction)press:(id)sender;

@end
