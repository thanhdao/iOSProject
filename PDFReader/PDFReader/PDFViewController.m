//
//  PDFViewController.m
//  PDFReader
//
//  Created by Thanh Dao on 5/6/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "PDFViewController.h"

@interface PDFViewController ()

@end

@implementation PDFViewController
@synthesize webView,pdfUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// View Did Load method -- Load the PDF
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Load pdf to webView
    webView.scalesPageToFit = YES;
    [webView loadRequest: [NSURLRequest requestWithURL: pdfUrl]];
    //[self.view addSubview: webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
