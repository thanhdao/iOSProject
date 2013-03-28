//
//  ViewController.h
//  SongManager
//
//  Created by iOS12 on 3/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *singerTextField;
@property (strong, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;

- (IBAction)search:(id)sender;


@end
