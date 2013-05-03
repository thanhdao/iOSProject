//
//  DetailViewController.m
//  FoodShop
//
//  Created by Thanh Dao on 4/7/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
     NSLog(@"View will appear");
    self.nameLabel.text = self.player.name;
    self.descriptionLabel.text = self.player.description;
    [self.imageView setImage: [UIImage imageNamed: self.player.photo]];
    //super viewWillAppear: animated];

}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"View did appear");
}
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"View will disappear");
    //NSLog(@"CurrentTimeViewController will DISappear");
    //[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"View did disappear");
}
- (void)viewDidLoad
{
    NSLog(@"View did load");
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
