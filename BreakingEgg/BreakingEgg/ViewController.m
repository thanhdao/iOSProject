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
    //Khởi tạo 
    self.shake = 0; // Số lần lắc
    UIImageView *eggViewStart = [[UIImageView alloc] initWithFrame:self.view.frame];

    UIImage *image = [UIImage imageNamed:@"IMG_0047.JPG"];
    eggViewStart.image = image;
    
    
    [self.view addSubview:eggViewStart];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

// Hàm hiển thị quả trứng vỡ sau mỗi lần lắc.
- (void)animationEgg{
    
    self.shake += 1;
    self.shake = self.shake % 7;
    switch (self.shake) {
            // Lắc lần 0
        case 0:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0047.JPG"];
            [self.view addSubview:eggView];
        }
            break;
            // Lắc lần 1
        case 1:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0048.JPG"];
            [self.view addSubview:eggView];
        }
        break;
        // Lắc lần 2
        case 2:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0049.JPG"];
            [self.view addSubview:eggView];
        }
            break;
       // Lắc lần 3
        case 3:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0050.JPG"];
            [self.view addSubview:eggView];
        }
            break;
     // Lắc lần 4
        case 4:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0050.JPG"];
            [self.view addSubview:eggView];
        }
            break;
            
        // Lắc lần 5
        case 5:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0051.JPG"];
            [self.view addSubview:eggView];
        }
            break;
        // Lắc lần 6
        case 6:
        {
            UIImageView *eggView = [[UIImageView alloc] initWithFrame:self.view.frame];
            
            eggView.image = [UIImage imageNamed: @"IMG_0052.JPG"];
            [self.view addSubview:eggView];
        }
            break;
            
        default:
            break;
    }
    
    
    /* // Hien thi animation quả trứng
     vỡ
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
