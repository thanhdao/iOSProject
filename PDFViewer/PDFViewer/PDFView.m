//
//  PDFView.m
//  PDFViewer
//
//  Created by Thanh Dao on 5/10/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "PDFView.h"

@implementation PDFView
{
    CGPDFPageRef _PDFPage;
    CGFloat _PDFScale;

}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
- (void)setPDFPage:(CGPDFPageRef)PDFPage
{
    CGPDFPageRetain(PDFPage);
    CGPDFPageRelease(_PDFPage);
    _PDFPage = PDFPage;
    [self myInit];
    
}
-(void)myInit
{
    //Determine the size of the PDF page.
    CGRect pageRect = CGPDFPageGetBoxRect(_PDFPage, kCGPDFMediaBox);
    _PDFScale = self.frame.size.width/pageRect.size.width;
    pageRect.size = CGSizeMake(pageRect.size.width * _PDFScale, pageRect.size.height * _PDFScale);
    
    //UIGraphicsBeginImageContext(pageRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // First fill the background with white.
    CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
    CGContextFillRect(context,pageRect);
    
    CGContextSaveGState(context);
    // Flip the context so that the PDF page is renderd  right side up
    CGContextTranslateCTM(context, 0.0, pageRect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    //Scale the context so that the PDF page is rendered at the correct size for the zoom level.
    CGContextScaleCTM(context, _PDFScale, _PDFScale);
    CGContextDrawPDFPage(context, _PDFPage);
    CGContextRestoreGState(context);
    
    //UIGraphicsEndImageContext();
    
    

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //Determine the size of the PDF page.
      
}
*/

@end
