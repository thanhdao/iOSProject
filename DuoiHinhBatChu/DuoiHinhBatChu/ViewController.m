//
//  ViewController.m
//  DuoiHinhBatChu
//
//  Created by iOS12 on 3/24/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray * famousPeopleArray;
    NSMutableArray *mutableArray;
}
@end

@implementation ViewController

- (IBAction)loadFamousPeople:(id)sender {
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"NguoiNoiTieng" ofType:@"plist"];
    NSLog(@"Path: %@", dataPath);
    
    famousPeopleArray = [[NSArray alloc] initWithContentsOfFile: dataPath];
    NSLog(@"%@", famousPeopleArray);
    mutableArray = [NSMutableArray arrayWithArray: famousPeopleArray];

}

- (IBAction)randomPeople:(id)sender {
    
    /*
    int peopleNum = 0;
    int randomFamousPeople[5];
    for (int i; i < 5; i++) {
        randomFamousPeople [i] = -1;
    }
    BOOL isDuplicate = NO;
    
    while (peopleNum < 5) {
        
        int index = arc4random() % 10;
        
        //[mutableArray exchangeObjectAtIndex:index withObjectAtIndex: (10 - index)];
        
        for (int i = 0; i < 5; i++) {
            if (index == randomFamousPeople[i]) {
                isDuplicate = YES;
            }
        }
        
        if (!isDuplicate) {
            randomFamousPeople[peopleNum] = index;
            peopleNum += 1;
            
            isDuplicate = NO;
        }
        
        
    }
    for (int i = 0; i < 5; i++) {
        NSLog(@"5 Famous People: %@", [famousPeopleArray objectAtIndex:randomFamousPeople[i]]);
    }
    
*/
    NSLog(@" \n Top 5 random of famous people:");
    for(int i = 0; i < 5; i++){
        int random = arc4random() % ([mutableArray count]);
        [mutableArray exchangeObjectAtIndex:random withObjectAtIndex:([mutableArray count] -1 -i)];
    }
    for(int i = 5; i<[mutableArray count]; i++) {
        NSLog(@"%@", [mutableArray objectAtIndex:i]);
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
