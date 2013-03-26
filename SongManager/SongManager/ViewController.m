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
    
    Song *song1 = [[Song alloc] initWithTitle: @"Numb"
                                       singer: @"Linkin Park"
                                         year: 2000
                                        genre: @"Rock"];
    Song *song2 = [[Song alloc] initWithTitle: @"New Devide"
                                       singer: @"Linkin Park"
                                         year: 2001
                                        genre: @"Rock"];

    Song *song3 = [[Song alloc] initWithTitle: @"New Year Day"
                                       singer: @"U2"
                                         year: 2005
                                        genre: @"Rock"];

    Song *song4 = [[Song alloc] initWithTitle: @"America"
                                       singer: @"Simon"
                                         year: 1990
                                        genre: @"POP"];

    Song *song5 = [[Song alloc] initWithTitle: @"Let it be"
                                       singer: @"The Beatle"
                                         year: 1968
                                        genre: @"POP"];

    Song *song6 = [[Song alloc] initWithTitle: @"Something More"
                                       singer: @"Nick Vujicic"
                                         year: 2010
                                        genre: @"POP"];

    Song *song7 = [[Song alloc] initWithTitle: @"Freebird"
                                       singer: @"Lynyrd Skynyrd"
                                         year: 1900
                                        genre: @"Rock"];
    self.songList = [[NSMutableSet alloc] initWithObjects: song1,song2,song3,song4,song5,song6,song7, nil];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)search:(id)sender {
    
    NSString *titleSearchString = self.titleTextField.text;
    NSString *singerSearchString = self.singerTextField.text;
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat: @"(title CONTAINS[cd] %@) AND (singer CONTAINS[cd] %@) ", titleSearchString, singerSearchString ];
    
    NSSet *results = [self.songList filteredSetUsingPredicate:  searchPredicate];
    
    for(Song *s in results){
        NSLog (@"%@", s);

    }
    
        
}
@end
