//
//  ViewController.m
//  TestPDFDocument
//
//  Created by thanhnv on 4/25/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "LeavesViewController.h"
#import "PDFPage.h"

@interface ViewController ()

@end

@implementation ViewController{
    CGContextRef context;
    CGPDFPageRef page;
    PDFPage *pdfView;
}
- (id)init {
    self = [super init];
    if (self) {
		[self loadPDF];
    }
    return self;
}

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle{
    if(self= [super initWithNibName:nibName bundle:nibBundle]){
        [self loadPDF];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self loadPDF];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pdfView =[[PDFPage alloc]initWithFrame:self.view.bounds];
    pdfView.book = bookPDF;
    pdfView.pageIndex = 1;
    [self.view addSubview:pdfView];
    

}

-(void)loadPDF
{
    CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("drawingwithquartz2d.pdf"), NULL, NULL);
    bookPDF = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
    CFRelease(pdfURL);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LeavesViewDataSource methods

- (NSUInteger) numberOfPagesInLeavesView:(LeavesView*)leavesView {
	return CGPDFDocumentGetNumberOfPages(bookPDF);
}

- (void) renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
	CGPDFPageRef page = CGPDFDocumentGetPage(bookPDF, index + 1);
//	CGAffineTransform transform = aspectFit(CGPDFPageGetBoxRect(page, kCGPDFMediaBox),
//											CGContextGetClipBoundingBox(ctx));
	//CGContextConcatCTM(ctx, transform);
	CGContextDrawPDFPage(ctx, page);
}


#pragma mark - LeavesViewDelegate methods

- (void) leavesView:(LeavesView *)leavesView didTurnToPageAtIndex:(NSUInteger)pageIndex
{
}

@end
