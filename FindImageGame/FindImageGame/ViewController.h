//
//  ViewController.h
//  FindImageGame
//
//  Created by Thanh Dao on 4/6/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backGround;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;


@end
