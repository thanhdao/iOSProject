//
//  LevelListViewController.m
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "LevelListViewController.h"
#import "GameViewController.h"

#define BUTTON_WIDTH  120
#define BUTTON_HEIGHT 30
#define X_COOR        100
#define Y_COOR        80  
#define ROW_DISTANCE  30
#define COLUMN_DISTANCE 27
#define ROW_NUMBER 6
#define COLUMN_NUMBER 2
#define LEVEL_NUMBER  11

//static int _totalScore;

@interface LevelListViewController ()
{
    UIButton *_levelButtons[LEVEL_NUMBER];
    GameViewController *_gameViewController;
}
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation LevelListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //];

    }
    return self;
}

- (void)viewDidLoad {
    //130, 202, 255
    self.view.backgroundColor = [UIColor colorWithRed: 0.51 green: 0.79 blue: 1 alpha:1];
    // Create back Button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(BACK_BUTTON_X, BACK_BUTTON_Y, BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGH);
    [backButton setImage:[UIImage imageNamed:@"backButton.png"]
                 forState:UIControlStateNormal];
    [backButton addTarget:self
                    action:@selector(backHome:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // Create app logo
    UIImageView *appLogoView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"dazzleMath.gif"]];
    appLogoView.frame = CGRectMake(0, 0, 152, 65);
    appLogoView.center = CGPointMake(160, 33);
    [self.view addSubview: appLogoView];
    
    UILabel *logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,152,30)];
    logoLabel.center   = CGPointMake(160, 80);
    logoLabel.backgroundColor = [UIColor clearColor];
    logoLabel.text = @"Multiplication";
    logoLabel.textAlignment = NSTextAlignmentCenter;
    logoLabel.font = [UIFont fontWithName: @"TrebuchetMS-Bold" size:22];
    [self.view addSubview: logoLabel];

    
    [self createGameLevel];
    
    [super viewDidLoad];
}

- (void)createGameLevel {
    // Create Levels
    for (int i = 0; i < LEVEL_NUMBER; i++) {
        _levelButtons[i] = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        _levelButtons[i].tag = i + 1;
        
        NSString *buttonTitle;
        
        if (i < 7) {
            buttonTitle = [NSString stringWithFormat:@"Level %d (x%d)",i + 1, i + 2];
        } else{
            buttonTitle = [NSString stringWithFormat:@"Level %d (x%d)*",i + 1, i + 2];
        }
        
        [_levelButtons[i] setTitle:buttonTitle forState:UIControlStateNormal];
        [self.view addSubview:_levelButtons[i]];
        
        _levelButtons[i].userInteractionEnabled = YES;
        
        [_levelButtons[i] addTarget:self
                             action:@selector(playGame:)
                   forControlEvents:UIControlEventTouchUpInside];
    }
    
    //Level button frames
    for (int i = 0; i < ROW_NUMBER; i++) {
        for (int j = 0; j < COLUMN_NUMBER; j++) {
            CGRect buttonFrame = CGRectMake((COLUMN_DISTANCE * (j + 1) + BUTTON_WIDTH * j), Y_COOR + (ROW_DISTANCE * (i + 1) + BUTTON_HEIGHT * i), BUTTON_WIDTH, BUTTON_HEIGHT);
            _levelButtons[j + i * COLUMN_NUMBER].frame = buttonFrame;
        }
    }
    _gameViewController = [[GameViewController alloc] initWithNibName: @"GameViewController" bundle: nil];
}

- (void)soundClick{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Click" ofType:@"wav"];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
    [_audioPlayer play];
}

- (void)playGame:(id)sender {
    [self soundClick];
    UIButton *levelButton = (UIButton *)sender;
    int level = levelButton.tag;
    int scorePreviousLevel;
    
    if (level >= 2) {
        scorePreviousLevel = [[_gameViewController.levelScoreArray objectAtIndex:level -2] intValue];
    }
    
    if ((level >= 8) && (scorePreviousLevel < 60)) {
        NSString *message;
        if (level == 8) {
            message = [NSString stringWithFormat: @"Start Challenge stage by clearing Level %d",level - 1];
        } else{
            message = [NSString stringWithFormat: @"To play, please clear level %d",level - 1];
        }
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: nil
                                                            message: message
                                                           delegate: nil
                                                  cancelButtonTitle: @"Close"
                                                  otherButtonTitles: nil];
            [alert show];
        
    } else{
        
        _gameViewController.level = level;
        [_gameViewController generateQuestion];
        
        [self presentViewController:_gameViewController
                           animated:YES
                         completion:nil];
    }
}

- (void)alertLockLevel{
    
}
- (IBAction)backHome:(id)sender {
    [self soundClick];
    [self dismissViewControllerAnimated: YES
                             completion: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
