//
//  FruitViewCell.m
//  Fun Multiplications For Kids
//
//  Created by Thanh Dao on 4/18/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "FruitViewCell.h"


@interface FruitViewCell ()
{
    UIImageView *_imageArray[TIME_TABLE_SIZE];
}
@end

@implementation FruitViewCell


- (id)  initWithFrame:(CGRect)frame
    withNumberOfImage:(int)imageNumber
             andImage:(UIImage *)image {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        //int rowNumber = 3
        
        int rowNumber ; // = imageNumber / 4 ;
        int columnNumber;// = imageNumber / 3;
        
        // Calculate row Number and column number to display image
        if ((imageNumber % 3) == 0) {
            columnNumber = imageNumber / 3;
            
        } else{
            columnNumber = (imageNumber / 3) + 1  ;
        }
        if ((imageNumber % columnNumber) == 0) {
            rowNumber = imageNumber / columnNumber;
        } else{
            rowNumber = imageNumber / columnNumber + 1 ;
        }
        
        int imageTableSize = rowNumber * columnNumber;
        
        float rowDistance;
        float columnDistance;
        float cellWidth;
        float cellHeight;
        
        // Small cell size
        columnDistance  = 3 * (4 / columnNumber) * (frame.size.width / 80);
        cellHeight      = 17 * (3 / rowNumber) * (frame.size.height / 60);
        cellWidth = 17 * (4 / columnNumber) * (frame.size.width / 80);
        rowDistance  = 3 * (3 / rowNumber) * (frame.size.height / 60);
        
        /*
        if (rowNumber == 1) {
            //rowDistance = columnDistance;
            //cellWidth = cellHeight;
            rowDistance = 2;
        } else{
            rowDistance  = 3 * (3 / rowNumber) * (frame.size.height / 60);
        }
        */
        // Create and add small cell to big cell
        int index = imageTableSize - imageNumber;
        
        for (int i = index; i < imageTableSize; i++) {
            _imageArray[i] = [[UIImageView alloc] init];
            _imageArray[i].image = image;
            _imageArray[i].contentMode = UIViewContentModeScaleAspectFit;
            [self addSubview:_imageArray[i]];
            //_imageArray[i].tag = i;
        }
        
        for (int i = 0; i < rowNumber  ; i++) {
            for (int j = 0; j < columnNumber ; j++) {
                CGRect cellFrame = CGRectMake((columnDistance * j + cellWidth * j), (rowDistance * i + cellHeight * i), cellWidth, cellHeight);
                _imageArray[j + i * columnNumber].frame = cellFrame;
            }
        }

    }
    return self;
}

//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
