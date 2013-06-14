//
//  PDFScrollView.m
//  PDFViewer
//
//  Created by Thanh Dao on 5/10/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "PDFScrollView.h"
#import <QuartzCore/QuartzCore.h>
#import "PDFView.h"

@implementation PDFScrollView
{
    CGPDFPageRef _PDFPage;
    CGPDFDocumentRef _PDFDocument;
    CGFloat _PDFScale;
    NSMutableArray *_pdfPageArray;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        _pdfPageArray = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)setPDFDocument:(CGPDFDocumentRef)PDFDocument
{
    CGPDFDocumentRetain(PDFDocument);
    CGPDFDocumentRelease(_PDFDocument);
    _PDFDocument = PDFDocument;

}

- (void)setPDFPage:(CGPDFPageRef)PDFPage
{
    CGPDFPageRetain(PDFPage);
    CGPDFPageRelease(_PDFPage);
    _PDFPage = PDFPage;
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect
{
 
    size_t pageNum =  CGPDFDocumentGetNumberOfPages (_PDFDocument);
    for (size_t i = 1; i <= pageNum; i++)
     {
       //size_t i = 1;
       CGPDFPageRef PDFPage = CGPDFDocumentGetPage(_PDFDocument, i);
       CGRect pdfPageFrame = CGRectMake(0, 480*(i-1),320, 480*i);
       PDFView *pdfPageView = [[PDFView alloc] initWithFrame:pdfPageFrame];
       [pdfPageView setPDFPage: PDFPage];
       //[_pdfPageArray addObject: pdfPageView];
         [self addSubview: pdfPageView];
      }
    
    //int count = [_pdfPageArray count];
    //for (int i = 0; i < count; i++) {
    //    [self addSubview: [_pdfPageArray objectAtIndex: i]];
    //}
    
 /*
    //Determine the size of the PDF page.
    CGRect pageRect = CGPDFPageGetBoxRect(_PDFPage, kCGPDFMediaBox);
    _PDFScale = rect.size.width/pageRect.size.width;
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
*/
}


@end
