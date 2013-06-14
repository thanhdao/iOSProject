//
//  PDFPage.m
//  TestPDFDocument
//
//  Created by thanhnv on 4/26/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "PDFPage.h"

@implementation PDFPage


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    self.backgroundColor = [UIColor clearColor];
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    // Drawing code
    CGPDFPageRef page;
    CGContextRef context = UIGraphicsGetCurrentContext();
    page = CGPDFDocumentGetPage(self.book, self.pageIndex);
    
    CGRect innerRect=CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
    CGRect outnerRect=CGContextGetClipBoundingBox(context);
    CGAffineTransform transform = aspectFit(innerRect,
                                            outnerRect);
	CGContextConcatCTM(context, transform);
    
//    int rotationAngle = CGPDFPageGetRotationAngle(page);
//    rotationAngle =360;
//	CGAffineTransform transform2 = CGPDFPageGetDrawingTransform(page, kCGPDFCropBox, self.bounds, rotationAngle, YES);
//    CGContextSaveGState (context);
//	CGContextConcatCTM(context, transform2);
    
    CGContextDrawPDFPage(context, page);
    CGPDFDocumentRelease (self.book);
    
}
CGAffineTransform aspectFit(CGRect innerRect, CGRect outerRect) {
	CGFloat scaleFactor = MIN(outerRect.size.width/innerRect.size.width, outerRect.size.height/innerRect.size.height);
	CGAffineTransform scale = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
	CGRect scaledInnerRect = CGRectApplyAffineTransform(innerRect, scale);
	CGAffineTransform translation =
	CGAffineTransformMakeTranslation((outerRect.size.width - scaledInnerRect.size.width) / 2 - scaledInnerRect.origin.x,
									 (outerRect.size.height - scaledInnerRect.size.height) / 2 - scaledInnerRect.origin.y);
	return CGAffineTransformConcat(scale, translation);
}


@end
