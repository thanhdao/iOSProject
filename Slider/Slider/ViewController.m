//
//  ViewController.m
//  Slider
//
//  Created by Thanh Dao on 3/28/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *sliderA;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeSlider:(id)sender {
    
    _label.text = [NSString stringWithFormat: @"%0.2f",_sliderA.value];
    
   
}

@end
