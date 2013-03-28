//
//  ViewController.m
//  BreakingEgg
//
//  Created by Thanh Dao on 3/28/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign) int shake;

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.shake = 0;
    UIImageView *eggViewStart = [[UIImageView alloc] initWithFrame:self.view.frame];

    eggViewStart.image = [UIImage imageNamed:@"IMG_0047.JPG"];
    [self.view addSubview:eggViewStart];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)animationEgg{
    
    self.shake += 1;
    switch (self.shake) {
        case 1:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0048.JPG"];
            [self.view addSubview:eggView];
        }
        break;
        case 2:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0049.JPG"];
            [self.view addSubview:eggView];
        }
            break;
        case 3:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0050.JPG"];
            [self.view addSubview:eggView];
        }
            break;
        case 4:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0050.JPG"];
            [self.view addSubview:eggView];
        }
            break;
        case 5:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0051.JPG"];
            [self.view addSubview:eggView];
        }
            break;
        case 6:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0052.JPG"];
            [self.view addSubview:eggView];
            self.shake = -1;
        }
            break;
            
        default:
            break;
    }
    
    
    /*
    UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
    
    // load all the frames of our animation
    eggView.animationImages = [NSArray arrayWithObjects:
                               
                               [UIImage imageNamed:@"IMG_0048.JPG"],
                               [UIImage imageNamed:@"IMG_0049.JPG"],
                               [UIImage imageNamed:@"IMG_0050.JPG"],
                               [UIImage imageNamed:@"IMG_0051.JPG"],
                               [UIImage imageNamed:@"IMG_0052.JPG"],
                               nil];
    
    // all frames will execute in 1.75 seconds
    
    
    eggView.animationDuration = 2;
    // repeat the annimation forever
    eggView.animationRepeatCount = 1;
    // start animating
    [eggView startAnimating];
    
    // add the animation view to the main window
    [self.view addSubview:eggView];
    */
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
