//
//  DetailViewController.h
//  Storyboard
//
//  Created by Thanh Dao on 4/9/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end