//
//  PDFPage.h
//  TestPDFDocument
//
//  Created by thanhnv on 4/26/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFPage : UIView
@property (nonatomic) CGPDFDocumentRef book;
@property (nonatomic) int pageIndex;
@end
