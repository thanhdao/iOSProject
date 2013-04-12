//
//  ViewController.m
//  Hello
//
//  Created by Thanh Dao on 4/9/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"
#import "FruitDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    FruitClass *apple = [[FruitClass alloc] init];
    apple.fruitName = @"Apple";
    apple.imageFilename = @"apple.png";
    apple.family = @"Rosaceae";
    apple.genus = @"Malus";
    
    FruitClass* banana = [[FruitClass alloc] init];
    banana.fruitName = @"Banana";
    banana.imageFilename = @"banana.png";
    banana.family = @"Musaceae";
    banana.genus = @"Musa";
    
    FruitClass* orange = [[FruitClass alloc] init];
    orange.fruitName = @"Orange";
    orange.imageFilename = @"orange.png";
    orange.family = @"Rutaceae";
    orange.genus = @"Citrus";
    
    FruitClass* peach = [[FruitClass alloc] init];
    peach.fruitName = @"Peach";
    peach.imageFilename = @"peach.png";
    peach.family = @"Rosaceae";
    peach.genus = @"Prunus";
    
    _arrayOfFruits = [[NSArray alloc] initWithObjects: apple, banana, orange, peach, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)applePress:(id)sender {
    FruitClass *appleData = [_arrayOfFruits objectAtIndex: 0];
    
    
    FruitDetailViewController *detailView = [[FruitDetailViewController alloc] init];
    
    //[self.navigationController pushViewController: detailView animated:YES];
    detailView.dataObject = appleData;
    [self presentViewController: detailView
                       animated: YES
                     completion: nil];
}

- (void)prepareForSegue: (UIStoryboardSegue *)segue
                 sender: (id)sender {
    /*
    // apple segue
    if ([segue.identifier isEqualToString: @"appleSegue"]) {
        FruitClass *appleData = [_arrayOfFruits objectAtIndex: 0];
        
        FruitDetailViewController *detailView = segue.destinationViewController;
        //FruitDetailViewController *detailView = [[FruitDetailViewController alloc] init];
        
        //[self.navigationController pushViewController: detailView animated:YES];
        detailView.dataObject = appleData;
    }
     */
    // banana segue
    if ([segue.identifier isEqualToString: @"bananaSegue"]) {
        FruitClass *bananaData = [_arrayOfFruits objectAtIndex:1];
        
        FruitDetailViewController *detailView =
        segue.destinationViewController;
        detailView.dataObject = bananaData;
    }
    // orange segue
    if ([segue.identifier isEqualToString: @"orangeSegue"]) {
        
        FruitClass *orangeData = [_arrayOfFruits objectAtIndex: 2];FruitDetailViewController *detailView =
        segue.destinationViewController;
        detailView.dataObject = orangeData;
    }
    // peach segue
    if ([segue.identifier isEqualToString: @"peachSegue"]) {
    
    
       FruitClass *peachData = [_arrayOfFruits objectAtIndex: 3];
       FruitDetailViewController *detailView =
       segue.destinationViewController;
        detailView.dataObject = peachData;
    }

}


@end
