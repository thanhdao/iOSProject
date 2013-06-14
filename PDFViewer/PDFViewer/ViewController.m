//
//  ViewController.m
//  PDFViewer
//
//  Created by Thanh Dao on 5/6/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "ViewController.h"
#import "PDFScrollView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Open the PDF document one page
    //NSURL *pdfURL = [[NSBundle mainBundle] URLForResource: @"DrawingPrintingiOS" withExtension: @"pdf"];
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *stringPath = [NSString stringWithFormat:@"%@/DrawingPrintingiOS.pdf",documentsDirectory];
    NSLog(@"%@",documentsDirectory);
    CFStringRef path =  (__bridge CFStringRef) stringPath;
    
    
   CFURLRef pdfURL = CFURLCreateWithFileSystemPath(NULL, path,kCFURLPOSIXPathStyle,0);

    CGPDFDocumentRef PDFDocument = CGPDFDocumentCreateWithURL(pdfURL);
    size_t pageNum =  CGPDFDocumentGetNumberOfPages (PDFDocument);
    PDFScrollView *pdfScrollView = [[PDFScrollView alloc] initWithFrame:self.view.bounds];
    [pdfScrollView setPDFDocument: PDFDocument];
    [pdfScrollView setContentSize: CGSizeMake(320, 480 * pageNum)];

    //CGPDFPageRef PDFPage = CGPDFDocumentGetPage(PDFDocument, 1);
    //[pdfScrollView setPDFPage:PDFPage];
    [self.view addSubview: pdfScrollView];
     
    CGPDFDocumentRelease(PDFDocument);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{

}
@end
