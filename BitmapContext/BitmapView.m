//
//  bitmapView.m
//  BitmapContext
//
//  Created by Thanh Dao on 5/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "BitmapView.h"

@implementation BitmapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //int myWidth = 300;
    //int myHeight = 400;
    CGRect myBoundingBox = CGRectMake(0, 0, 100, 100);
    CGContextRef myBitmapContext = MyCreateBitmapContext(rect.size.width,rect.size.height);
    // Drawing code
    CGContextSetRGBFillColor(myBitmapContext, 1, 0, 0, 1);
    CGContextFillRect(myBitmapContext, CGRectMake(0, 0, 200, 100));
    CGContextSetRGBFillColor(myBitmapContext, 0, 0, 1, 0.5);
    CGContextFillRect(myBitmapContext, CGRectMake(0, 0, 100, 200));
    CGImageRef myImage = CGBitmapContextCreateImage(myBitmapContext);
    CGContextRef myContext = UIGraphicsGetCurrentContext();

    CGContextDrawImage(myContext, myBoundingBox, myImage);
    char *bitmapData = CGBitmapContextGetData(myBitmapContext);
    CGContextRelease (myBitmapContext);
    if (bitmapData) {
        free(bitmapData);
    }
    CGImageRelease(myImage);

}
CGContextRef MyCreateBitmapContext(int pixelsWide, int pixelsHigh)
{
    CGContextRef context = NULL;
    CGColorSpaceRef colorSpace;
    void *bitmapData;
    int bitmapByteCount;
    int bitmapBytesPerRow;
    
    //Declares a variable to represent the number of bytes per row.
    //Each pixel in the bitmap in this example represented by 4 bytes
    //8 bits each of red, green, blue, and alpha.
    bitmapBytesPerRow = pixelsWide * 4;
    bitmapByteCount = bitmapBytesPerRow * pixelsHigh;
    
    //Creates a generic RGB color space. You can also create a CMYK
    colorSpace = CGColorSpaceCreateDeviceRGB();
    //Calls the calloc function to create and clear a block of memory in which to store the bitmap data. This example creates a 32 bit RGBA bitmap. Each pixel in the bitmap occupies 4 bytes of memory. if you pass NULL as bitmap data, Quartz automatically allocates space for the bitmap.
    bitmapData = calloc(pixelsHigh, bitmapBytesPerRow);
    if (bitmapData == NULL) {
        fprintf(stderr, "Memory not allocated!");
        return NULL;
    }
    //Creates a bitmap graphics context, supplying the bitmap data, the width and height of the bitmap, the number of bits per component, the bytes per row, the color space and a constant that specifies whether the bitmap should contain an alpha channel and its relative location in a pixel.
    // kCGImageAlphaPremultipliedLast indicates that the alpha component is stored in the last byte of each pixel and that the color components have already been multiplied by this alpha value)
    context = CGBitmapContextCreate(bitmapData,pixelsWide
                                    ,pixelsHigh,
                                    8, //bits per component
                                    bitmapBytesPerRow,
                                    colorSpace,kCGImageAlphaPremultipliedLast) ;
    //Free the memory if bitmap graphic context isn't created
    if (context == NULL) {
        free(bitmapData);
        fprintf(stderr, "Context not created!");
        return NULL;
    }
    //Release the color space
    CGColorSpaceRelease(colorSpace);
    
    return context;
    
}

@end
