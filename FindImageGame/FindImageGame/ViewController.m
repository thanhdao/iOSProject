//
//  ViewController.m
//  FindImageGame
//
//  Created by Thanh Dao on 4/6/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"

#define rowDistance 20
#define columnDistance 20
#define width 57
#define length 57
#define gameSize 24
#define columnNumber 4
#define rowNumber 6

typedef enum {
    
    FAIL,
    WIN,
    WAIT,
    
} gameStatus;
@interface ViewController ()
{
    NSMutableArray *_imageArray;
    //NSArray *_imageViewArray;
    //UIImageView *_backGroundView;
    UIImageView *_imageView[gameSize]; // 
    UIImageView *_imageChooseFirst; // Chon anh 1
    UIImageView *_imageChooseSecond; // Chon anh 2
    UIImage *_backGirl;
    NSInteger  remainImage; 
    UIButton *_playAgain;
    gameStatus gStatus;
    
    
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    // Doi anh nen ung dung
    //backGroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"groundImage.jpg"]];
    //[_backGroundView.image ]
    //[_backGroundView a];
    //[self.view addSubview: _backGroundView];
    
    // Choi nhac
    gStatus = WAIT;
    [self playSound];
    
    // Anh co gai khi chua lat
    _backGirl = [UIImage imageNamed: @"backGirl.jpg"];
    //Xoa nut play again
    [_playAgain removeFromSuperview];
    
    // So luong anh ban dau
    remainImage = gameSize;
    
    UITapGestureRecognizer * tap[gameSize];
    for (int i = 0; i < gameSize; i++) {
        _imageView[i] = [[UIImageView alloc]initWithImage: _backGirl];
        _imageView[i].tag = i;
        [self.view addSubview: _imageView[i]];
        _imageView[i].userInteractionEnabled = YES;
        tap[i] = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip:)];
        [_imageView[i] addGestureRecognizer:tap[i]];
    }
    
    // Tao mang chua anh hien thi khi lat
    _imageArray = [NSMutableArray arrayWithObjects:@"girl1.jpg",@"girl1.jpg",@"girl2.jpg",@"girl2.jpg",@"girl3.jpg",@"girl3.jpg",@"girl4.jpg",@"girl4.jpg",@"girl5.jpg",@"girl5.jpg",@"girl6.jpg",@"girl6.jpg",@"girl7.jpg",@"girl7.jpg",@"girl8.jpg",@"girl8.jpg",@"girl9.jpg",@"girl9.jpg",@"girl10.jpg",@"girl10.jpg",@"girl11.jpg",@"girl11.jpg",@"girl12.jpg",@"girl12.jpg", nil];
    
    // Sinh anh ngau nhien
    for (int i = 0; i < [_imageArray count]; i++) {
        int randomImage = arc4random() % [_imageArray count];
        [_imageArray exchangeObjectAtIndex: i withObjectAtIndex: randomImage];
    }
    
    // Kich thuoc va vi tri khung anh
    for (int i = 0; i < columnNumber; i++){
        for(int j = 0; j < rowNumber; j++){
            _imageView[ i + j * columnNumber].frame = CGRectMake((rowDistance * (i + 1) + width * i), (columnDistance * (j + 1)+ length * j),width,length);
            //[_imageView[ i + j * columnNumber] ]
        }
    }

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) flip: (UITapGestureRecognizer *) gesture
{
    float flipTime = 0.8;
    UIImageView *imageFlipView = (UIImageView *)gesture.view;
    [UIView transitionWithView: imageFlipView duration: flipTime
                       options: UIViewAnimationOptionTransitionFlipFromLeft animations: ^{
                           imageFlipView.image = [UIImage imageNamed: _imageArray[imageFlipView.tag]];
                       }
                    completion: ^(BOOL finished){
                        if (!_imageChooseFirst) {
                            _imageChooseFirst = imageFlipView;
                            return;
                        }
                        if (_imageChooseFirst && !_imageChooseSecond) {
                            _imageChooseSecond = imageFlipView;
                        }
                        if (_imageChooseFirst && _imageChooseSecond) {
                            if ((_imageChooseFirst.image == _imageChooseSecond.image)
                                && (_imageChooseFirst.tag != _imageChooseSecond.tag))
                                {
                                    // Choi nhac
                                    gStatus = WIN;
                                    [self playSound];
            
                                [_imageChooseFirst removeFromSuperview];
                                [_imageChooseSecond removeFromSuperview];
                                remainImage -=2;
                                if (remainImage == 0) {
                                    [self endGame];
                                }
                            } else {
                                
                                [UIView transitionWithView: _imageChooseFirst duration: flipTime
                                                   options: UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                                                       _imageChooseFirst.image = _backGirl;
                                                   }
                                                completion: ^(BOOL finished){}];
                                
                                [UIView transitionWithView: _imageChooseSecond duration: flipTime
                                                   options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                                                       _imageChooseSecond.image = _backGirl;
                                                   }
                                                completion: ^(BOOL finished){}];
                                // Choi nhac
                                gStatus = FAIL;
                                [self playSound];

                                
                            }
                            
                            _imageChooseFirst = nil;
                            _imageChooseSecond = nil;
                            return;
                        }
                    }];
    


    
}

- (void)playSound {
    NSBundle *mainBundle = [NSBundle mainBundle];
    
        
    NSString *waitFilePath = [mainBundle pathForResource: @"Song" ofType: @"mp3"];
    NSData *waitFileData = [NSData dataWithContentsOfFile: waitFilePath];
    
    NSString *correctFilePath = [mainBundle pathForResource: @"correct" ofType: @"mp3"];
    NSData *correctFileData = [NSData dataWithContentsOfFile: correctFilePath];
    
    NSString *wrongFilePath = [mainBundle pathForResource: @"fail" ofType: @"mp3"];
    NSData *wrongFileData = [NSData dataWithContentsOfFile: wrongFilePath];

    NSError *error = nil;
    
    
          
    
    switch (gStatus) {
        case WAIT:
        {
            self.audioPlayer = [[AVAudioPlayer alloc] initWithData: waitFileData error: &error];
            // Did we get an instance of AVAudioPlayer?
            if (self.audioPlayer != nil){
                // Set the delegate and start playing
                self.audioPlayer.delegate = self;
                if ([self.audioPlayer prepareToPlay] &&
                    [self.audioPlayer play]){
                    
                    // Successfully started playing
                }
                
            }

        }
            break;
        case FAIL:
        {
            self.audioPlayer = [[AVAudioPlayer alloc] initWithData: wrongFileData error: &error];
            // Did we get an instance of AVAudioPlayer?
            if (self.audioPlayer != nil){
                // Set the delegate and start playing
                self.audioPlayer.delegate = self;
                if ([self.audioPlayer prepareToPlay] &&
                    [self.audioPlayer play]){
                    
                    // Successfully started playing
                }
                
            }
            
        }
            break;
        case WIN:
        {
            self.audioPlayer = [[AVAudioPlayer alloc] initWithData: correctFileData error: &error];
            // Did we get an instance of AVAudioPlayer?
            if (self.audioPlayer != nil){
                // Set the delegate and start playing
                self.audioPlayer.delegate = self;
                if ([self.audioPlayer prepareToPlay] &&
                    [self.audioPlayer play]){
                    
                    // Successfully started playing
                }
                
            }
            
        }
            break;
            
        default:
            break;
    }


}
- (void)endGame {
    _playAgain = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _playAgain.frame = CGRectMake(200,160, 100, 50);
    _playAgain.center = self.view.center;
    [_playAgain addTarget:self action:@selector(viewDidLoad) forControlEvents:UIControlEventTouchUpInside];
    [_playAgain setTitle: @"Play again!" forState:UIControlStateNormal];
    [self.view addSubview: _playAgain];
    gStatus = WAIT;
    [self playSound];


}
@end
