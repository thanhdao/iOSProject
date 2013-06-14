//
//  ViewController.h
//  TestPDFDocument
//
//  Created by thanhnv on 4/25/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LeavesViewController.h"

@interface ViewController : UIViewController
{
    CGPDFDocumentRef bookPDF;
}

- (void) loadPDF;
@end
