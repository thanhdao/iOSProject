//
//  FruitDetailViewController.m
//  Hello
//
//  Created by Thanh Dao on 4/9/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "FruitDetailViewController.h"

@interface FruitDetailViewController ()
@end

@implementation FruitDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fruitImage.image = [UIImage imageNamed: _dataObject.imageFilename];
    self.fruitName.text = [NSString stringWithFormat:@"Name: %@", _dataObject .fruitName];
    self.fruitFamily.text = [NSString stringWithFormat:@"Family: %@", _dataObject.family];
    self.fruitGenus.text = [NSString stringWithFormat:@"Genus: %@", _dataObject.genus];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
     [self dismissViewControllerAnimated: YES completion: nil];
}

- (IBAction)press:(id)sender {
    
    [self dismissViewControllerAnimated: YES completion: nil];
}
@end
