//
//  ViewController.h
//  HierachyImagic
//
//  Created by Thanh Dao on 4/2/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView4;
@property (nonatomic, assign) NSInteger insertCount;
@property (nonatomic, assign) NSInteger removeCount;
@property (nonatomic, assign) NSInteger exchangeCount;
- (IBAction)insertImage:(id)sender;
- (IBAction)removeImage:(id)sender;
- (IBAction)exchangeImage:(id)sender;

@end
