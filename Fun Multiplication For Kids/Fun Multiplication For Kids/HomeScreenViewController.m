//
//  HomeScreenViewController.m
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "LevelListViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

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
    UIImageView *backGroundImageView = [[UIImageView alloc] initWithFrame: self.view.bounds];
    [backGroundImageView setImage: [UIImage imageNamed: @"homeScreen.png"]];
    backGroundImageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview: backGroundImageView];
    UIButton *playButton = [UIButton buttonWithType: UIButtonTypeCustom];
    playButton.frame =  CGRectMake(200, 350, 60, 30);
    playButton.center = CGPointMake(160, 460);
    
    playButton.backgroundColor = [UIColor orangeColor];
    //[playButton setTitleColor: [UIColor orangeColor] forState: UIControlStateNormal];
    
    [playButton setTitle: @"Play" forState: UIControlStateNormal];
    [playButton addTarget: self action: @selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: playButton];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    LevelListViewController *levelListVC = [[LevelListViewController alloc] initWithNibName: @"LevelListViewController" bundle: nil];
    [self presentViewController: levelListVC
                       animated: YES
                     completion: nil];

    
}
@end
