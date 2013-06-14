//
//  FruitView.m
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/18/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "FruitView.h"
#import "FruitViewCell.h"
#import "Question.h"
@interface FruitView ()

{
    //
    FruitViewCell *_imageViewArray[TIME_TABLE_SIZE];
    //UIImageView *_operandTwo[OPERANONE_NUMBER];
    //DetailViewController *_detailViewController;
    
    
}
//@property (nonatomic, strong) UIScrollView *myScrollView;
//@property (assign) int playerNumber;
//@property (assign) int rowNumber;
//@property (assign) int columnNumber;

@end
@implementation FruitView

- (id)initWithFrame:(CGRect)fr andQuestion: (Question*)q
{
    self = [super initWithFrame:fr];
    if (self) {
        
        int imageViewNumber = q.operandOne;
        /*
        int bigRowNumber;//    =  imageViewNumber / 3 + 1;
        //if (imageViewNumber < 3) {
            //bigRowNumber = 1
        //}
        int bigColumnNumber ;
        
        if ((imageViewNumber % 3) == 0) {
            bigColumnNumber = 3;
            bigRowNumber = imageViewNumber / 3;
            
        } else {
            bigColumnNumber = imageViewNumber % 3;
            bigRowNumber = imageViewNumber / 3 +1;
        }
        */
        /*
        // big Cell size
        float bigRowDistance  = fr.size.height * 20 / 320;
        float bigColumnDistance  = fr.size.width * 20 / 320;
        float bigCellWidth = fr.size.width * 80 / 320;
        float bigCellHeight = fr.size.height * 60 / 320;
        */
        
        int bigRowNumber ; //   =  4;
        int bigColumnNumber;// = 3;
        // Calculate big row and big column number
        if ((imageViewNumber % 3) == 0) {
            bigRowNumber = imageViewNumber / 3;
            
        } else{
            bigRowNumber = (imageViewNumber / 3) + 1  ;
        }
        if ((imageViewNumber % bigRowNumber) == 0) {
            bigColumnNumber = imageViewNumber / bigRowNumber;
        } else{
            bigColumnNumber = imageViewNumber / bigRowNumber + 1 ;
        }
        
        float bigRowDistance;
        float bigColumnDistance;
        float bigCellWidth;
        float bigCellHeight;
        
        bigRowDistance  = 20 * (4 / bigRowNumber) * (fr.size.height / 320);
        bigColumnDistance  = 20 * (3 / bigColumnNumber) * (fr.size.width / 320);
        
        bigCellWidth = (fr.size.width - (bigColumnNumber + 1) * bigColumnDistance) / bigColumnNumber;
        
        if (bigRowNumber == 1) {
            bigCellHeight = bigCellWidth;
            
        } else{
            
        bigCellHeight = (fr.size.height - (bigRowNumber * bigRowDistance)) / bigRowNumber;
        }
        
        //float bigCellHeight = bigCellWidth;
        //int imageTableSize = bigRowNumber * bigColumnNumber;
        
        // Create image of big cell
        //int indexView = imageTableSize - imageViewNumber;
        for (int i = 0; i < imageViewNumber; i++) {
            _imageViewArray[i] = [[FruitViewCell alloc]initWithFrame: CGRectMake(0, 0, bigCellWidth, bigCellHeight) withNumberOfImage: q.operandTwo andImage: q.operandTwoImage];
            //_imageViewArray[i].backgroundColor = [[UIColor alloc]initWithRed:0.1 green:0.1 blue:0.1 alpha:0.5];
            [self addSubview: _imageViewArray[i]];
        }
                

        // Create frame of big Cell 
        for (int i = 0; i < bigRowNumber; i++) {
            for (int j = 0; j < bigColumnNumber; j++) {
                                
                CGRect imageViewRect = CGRectMake((bigColumnDistance * (j+1) + bigCellWidth * j), (bigRowDistance * (i + 1) + bigCellHeight * i), bigCellWidth, bigCellHeight);
                
                _imageViewArray[j + i * bigColumnNumber].frame = imageViewRect;
                             
            }
        }
        
    }
 
    return self;
}
/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

*/


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
