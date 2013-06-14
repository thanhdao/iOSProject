//
//  PDFScrollView.h
//  PDFViewer
//
//  Created by Thanh Dao on 5/10/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PDFScrollView : UIScrollView<UIScrollViewDelegate>

- (void)setPDFPage:(CGPDFPageRef)PDFPage;
- (void)setPDFDocument:(CGPDFDocumentRef)PDFDocument;


@end
