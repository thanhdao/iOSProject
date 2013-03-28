//
//  ViewController.m
//  SongManager
//
//  Created by iOS12 on 3/26/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#import "Song.h"

@interface ViewController ()

@property(nonatomic) NSMutableSet *songList;

@end

@implementation ViewController

- (void)viewDidLoad
{
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *bundlePathName = [[NSBundle mainBundle] resourcePath];
    NSString *hybridTheoryImage =[NSString stringWithFormat:@"%@/hybridtheory.jpg",  bundlePathName];
    
    Song *song1 = [[Song alloc] initWithTitle: @"In the End"
                                        album: @"Hybrid Theory"
                                       singer: @"Linkin Park"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile:hybridTheoryImage]];
    
    Song *song2 = [[Song alloc] initWithTitle: @"Crawling"
                                        album: @"Hybrid Theory"
                                       singer: @"Linkin Park"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile:hybridTheoryImage]];
    
                   
    Song *song3 = [[Song alloc] initWithTitle: @"Runaway"
                                        album: @"Hybrid Theory"
                                       singer: @"Linkin Park"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile:hybridTheoryImage]];
    
    Song *song4 = [[Song alloc] initWithTitle: @"Forgotten"
                                        album: @"Hybrid Theory"
                                       singer: @"Linkin Park"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile:hybridTheoryImage]];
    
   NSString *meteoraImage =[NSString stringWithFormat:@"%@/Meteora.jpg",  bundlePathName];
    Song *song5 = [[Song alloc] initWithTitle: @"Somwhere I belong"
                                        album: @"Meteora"
                                       singer: @"Linkin Park"
                                         year: 2007
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: meteoraImage]];
    Song *song6 = [[Song alloc] initWithTitle: @"Breaking the habbit"
                                        album: @"Meteora"
                                       singer: @"Linkin Park"
                                         year: 2007
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: meteoraImage]];
    
    Song *song7 = [[Song alloc] initWithTitle: @"From the inside"
                                        album: @"Meteora"
                                       singer: @"Linkin Park"
                                         year: 2007
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: meteoraImage]];
    Song *song8 = [[Song alloc] initWithTitle: @"Numb"
                                        album: @"Meteora"
                                       singer: @"Linkin Park"
                                         year: 2007
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: meteoraImage]];
  NSString *momentOfGloryImage =[NSString stringWithFormat:@"%@/MomentOfGlory.jpg",  bundlePathName];

    Song *song9 = [[Song alloc] initWithTitle: @"Moment of Glory"
                                        album: @"Moment of Glory"
                                       singer: @"Scorpions"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: momentOfGloryImage]];
    
    Song *song10 = [[Song alloc] initWithTitle: @"Still loving you"
                                        album: @"Moment of Glory"
                                       singer: @"Scorpions"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: momentOfGloryImage]];
    
    Song *song11 = [[Song alloc] initWithTitle: @"Send me an angel"
                                        album: @"Moment of Glory"
                                       singer: @"Scorpions"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: momentOfGloryImage]];
    
    Song *song12 = [[Song alloc] initWithTitle: @"Wind of change"
                                        album: @"Moment of Glory"
                                       singer: @"Scorpions"
                                         year: 2000
                                        genre: @"Rock"
                                   albumImage: [UIImage imageWithContentsOfFile: momentOfGloryImage]];
    
    self.songList = [[NSMutableSet alloc] initWithObjects: song1,song2,song3,song4,song5,song6,song7, song8,song9,song10,song11,song12, nil];
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)search:(id)sender {
    
    [self.titleTextField resignFirstResponder];
    [self.singerTextField resignFirstResponder];
        
    NSString *titleSearchString = self.titleTextField.text;
    NSString *singerSearchString = self.singerTextField.text;
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat: @"(title CONTAINS[cd] %@) OR (singer CONTAINS[cd] %@) ", titleSearchString, singerSearchString ];
    
    NSSet *results = [self.songList filteredSetUsingPredicate:  searchPredicate];
    
    for(Song *s in results){
        NSLog (@"%@", s);
        
        self.albumLabel.text = s.album;
        self.titleLabel.text = s.title;
        self.singerLabel.text = s.singer;

        self.albumImageView.image =  s.albumImage;
        [self.view   addSubview: self.albumImageView];
        

    }
    
        
}


@end
