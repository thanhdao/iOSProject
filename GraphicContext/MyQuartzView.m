//
//  MyQuartzView.m
//  GraphicContext
//
//  Created by Thanh Dao on 5/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "MyQuartzView.h"

@implementation MyQuartzView

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
    /* Demo CGContext
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    // Drawing here
    // Fill red color fully opaque
    CGContextSetRGBFillColor(myContext, 1, 0, 0, 1);
    //Fill rectangle with rect (0,0,200,100)
    CGContextFillRect(myContext, CGRectMake(0,0, 200, 100));
    // Set blue fill color that's partially transparent
    CGContextSetRGBFillColor(myContext, 0, 0, 1, 0.5);
    //Fill rectangle with rect (0,0,100,200)
    CGContextFillRect(myContext, CGRectMake(0, 0, 100, 200));
     */
    // PDF Context
    CGRect mediaBox;
    int myPageWidth = 320;
    int myPageHeight = 460;
    mediaBox = CGRectMake(0, 0, myPageWidth, myPageHeight);
    
    //Duong dan tao file pdf
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *stringPath = [NSString stringWithFormat:@"%@/TestPage.pdf",documentsDirectory];
    NSLog(@"%@",documentsDirectory);
    
    CFStringRef path =  (__bridge CFStringRef) stringPath;
    
    CGContextRef myPDFContext = MyPDFContextCreate(&mediaBox,path);
    CFStringRef myKeys[1];
    CFTypeRef myValues[1];
    myKeys[0] = kCGPDFContextMediaBox;
    myValues[0] = (CFTypeRef) CFDataCreate(NULL, (const UInt8 *)&mediaBox, sizeof(CGRect));
    CFDictionaryRef pageDictionary = CFDictionaryCreate(NULL, (const void**)myKeys, (const void**)myValues,1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    CGPDFContextBeginPage(myPDFContext, pageDictionary);
    CGContextSetRGBFillColor(myPDFContext, 1, 0, 0, 1);
    CGContextFillRect(myPDFContext, CGRectMake(0, 0, 200, 100));
    CGContextSetRGBFillColor(myPDFContext, 0, 0, 1, 0.5);
    CGContextFillRect(myPDFContext, CGRectMake(0, 0, 100, 200));
    CGPDFContextEndPage(myPDFContext);
    
    CFRelease(pageDictionary);
    CFRelease(myValues[0]);
    CGContextRelease(myPDFContext);
}

//Call CGPDFContextCreateWithURL to create a PDF graphics context
CGContextRef MyPDFContextCreate (const CGRect *inMediaBox,
                                 CFStringRef path)
{
    CGContextRef myOutContext = NULL;
    CFURLRef url;
    //Create CFURL object from CFString
    url = CFURLCreateWithFileSystemPath (NULL,  //NULL mean default allocator
                                         path,
                                         kCFURLPOSIXPathStyle,  //POSIX-style path name
                                         false);
    if (url != NULL) {
        //Calls the quartz 2d funtion to create a PDF graphic contet using the PDF location just created and a rectangle that specifies the bounds of the PDF
        myOutContext = CGPDFContextCreateWithURL (url,inMediaBox,NULL);
        
        //Releases the CFURL object
        CFRelease(url);
    }
    //Return the PDF graphics context
    return myOutContext;
}

                                                                                  

@end
