//
//  MainScreenVC.m
//  FoodShop
//
//  Created by Thanh Dao on 4/7/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "MainScreenVC.h"
#import "DetailViewController.h"
#import "DataManager.h"
#import "Player.h"


#define BUTTON_WIDTH 50
#define BUTTON_LENGTH 100
#define ROW_DISTANCE 30
#define COLUMN_DISTANCE 40
#define PLAYER_NUMBER 100

@interface MainScreenVC ()

{
    UIButton *_footballPlayers[PLAYER_NUMBER];
    DataManager *_playerData;
    DetailViewController *_detailViewController;
    
    
}
@property (nonatomic, strong) UIScrollView *myScrollView;
@property (assign) int playerNumber;
@property (assign) int rowNumber;
@property (assign) int columnNumber;

@end

@implementation MainScreenVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"FC Barcelona";
                
    }
    return self;
}

- (void)viewDidLoad
{
    
    _playerData = [DataManager sharedManager];
    self.playerNumber = [_playerData.playerList count];
    // 2 players each row
    self.columnNumber = 2;                
    self.rowNumber = self.playerNumber / self.columnNumber + 1;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: self.myScrollView];
    
    //Kich thuoc Scroll View, Nhieu hon 6 cau thu la phai cuon
    
    [_myScrollView setContentSize: CGSizeMake(320,460)];
    //[_myScrollView setContentSize: CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * self.playerNumber / 6)];
    //NSLog(@"%f",self.view.frame.size.width);
   
    
    // Tao cac nut chua anh player
    for (int i = 0; i < self.playerNumber; i++) {
        _footballPlayers[i] = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        _footballPlayers[i].tag = i;
        
        Player *player = [[Player alloc] init];
        
        player = [_playerData.playerList objectAtIndex: i] ;
        
        UIImage *image = [UIImage imageNamed: player.photo];
        [_footballPlayers[i] setImage: image forState: UIControlStateNormal];
        
        [self.myScrollView addSubview: _footballPlayers[i]];
        
        _footballPlayers[i].userInteractionEnabled = YES;
        
        [_footballPlayers[i] addTarget: self
                   action: @selector(onUserTap:) forControlEvents:UIControlEventTouchUpInside];
        }

    // Draw button on scroll view
    for (int i = 0; i < self.rowNumber; i++) {
        for (int j = 0; j < self.columnNumber; j++){
            _footballPlayers[ j + i * self.columnNumber ].frame = CGRectMake((COLUMN_DISTANCE * (j + 1) + BUTTON_WIDTH * j), (ROW_DISTANCE * (i + 1) + BUTTON_LENGTH * i),BUTTON_WIDTH,BUTTON_LENGTH);
        }
    }

}
- (void)onUserTap: (UIButton *)button{
    
    if (!_detailViewController) {
         _detailViewController  = [[DetailViewController alloc] initWithNibName: @"DetailViewController" bundle: nil];
    }
     
    Player *player = [[Player alloc] init];
    player = [_playerData.playerList objectAtIndex: button.tag];
    
    _detailViewController.player = player;
        
    UIBarButtonItem *myBarButtonItem = [UIBarButtonItem new ];
    myBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = myBarButtonItem;
    
    [self.navigationController
     pushViewController: _detailViewController
               animated: YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
