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
    self.nameLabel.text = self.player.name;
    self.descriptionLabel.text = self.player.description;
    [self.imageView setImage: [UIImage imageNamed: self.player.photo]];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
