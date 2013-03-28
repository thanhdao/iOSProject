//
//  ViewController.m
//  BaiTapSlider
//
//  Created by Thanh Dao on 3/28/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
@property (weak, nonatomic) IBOutlet UIImageView *aImager;

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
- (IBAction)changeSliderValue:(id)sender {
    
    _aLabel.text = [NSString stringWithFormat:@"%0.2f", _aSlider.value];
    _aImager.alpha = _aSlider.value;
    //float x = (_aSlider.value * _aSlider.frame.size.width );
    
    //[_aLabel setFrame: CGRectMake(x, 50, 42, 21)];
    float centerX = 18 + _aSlider.value * (_aSlider.frame.size.width - 18);
    _aLabel.center = CGPointMake(centerX, 50);
}

@end
