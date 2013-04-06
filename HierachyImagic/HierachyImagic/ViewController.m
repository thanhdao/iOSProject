//
//  ViewController.m
//  HierachyImagic
//
//  Created by Thanh Dao on 4/2/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
#define photo1 1
#define photo2 2
#define photo3 3
#define photo4 4
@implementation ViewController

- (void)viewDidLoad
{
    self.insertCount = 0;
    self.removeCount = 0;
    self.exchangeCount = 0;

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insertImage:(id)sender {
    self.insertCount += 1;
    self.insertCount = self.insertCount % 5;
    switch (self.insertCount) {
        case 1:{
            self.imageView1.frame = CGRectMake(0, 0, 160, 240);
            self.imageView1.image =  [UIImage imageNamed:@"1.jpg"];
            [self.view addSubview: self.imageView1];
        }
            break;
        case 2:{
            self.imageView2.frame = CGRectMake(31, 99, 160, 240);
            self.imageView2.image =  [UIImage imageNamed:@"2.jpg"];

            [self.view addSubview: self.imageView2];
        }
            break;
        case 3:{
            self.imageView3.frame = CGRectMake(31, 99, 89,146);
            self.imageView3.image =  [UIImage imageNamed:@"3.jpg"];

            [self.view addSubview: self.imageView3];
        }
            break;
        case 4:{
            self.imageView4.frame = CGRectMake(160, 220, 160, 240);
            self.imageView4.image =  [UIImage imageNamed:@"4.jpg"];

            [self.view addSubview: self.imageView4];
        }
            break;

        default:
            break;
    }
    
}

- (IBAction)removeImage:(id)sender {
}

- (IBAction)exchangeImage:(id)sender {
}
@end
