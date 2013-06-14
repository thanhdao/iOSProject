//
//  PDFViewController.h
//  PDFReader
//
//  Created by Thanh Dao on 5/6/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView *webView;
    NSURL *pdfUrl;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSURL              *pdfUrl;

@end
