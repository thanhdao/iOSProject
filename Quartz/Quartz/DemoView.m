//
//  DemoView.m
//  Quartz
//
//  Created by Thanh Dao on 5/8/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

 CGContextRef MyPDFContextCreate (const CGRect *inMediaBox,
 CFStringRef path)
 {
 CGContextRef myOutContext = NULL;
 CFURLRef url;
 url = CFURLCreateWithFileSystemPath (NULL,
 path,
 kCFURLPOSIXPathStyle,
 false);
 if (url != NULL) {
 myOutContext = CGPDFContextCreateWithURL (url,inMediaBox,
                                           
 NULL);
 CFRelease(url);
 }
 return myOutContext;
 }
 

/*
CGContextRef MyPDFContextCreate (const CGRect *inMediaBox,
                                 CFStringRef path)
{
    CGContextRef myOutContext = NULL;
    CFURLRef url;
    CGDataConsumerRef    dataConsumer;
    
    url = CFURLCreateWithFileSystemPath (NULL,
                                         path,
                                         kCFURLPOSIXPathStyle,
                                         false);
    if (url != NULL) {
        dataConsumer = CGDataConsumerCreateWithURL(url);
        if (dataConsumer != NULL) {
            myOutContext = CGPDFContextCreate(dataConsumer, inMediaBox, NULL);
            
            CGDataConsumerRelease (dataConsumer);
        }
        CFRelease(url);
    }
    return myOutContext;
}
*/
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // View graphics context in iOS
    /*
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(myContext, 1, 0, 0, 1);
    CGContextFillRect(myContext, CGRectMake(0,0,200,100));
    CGContextSetRGBFillColor(myContext,0,0,1,.5);
    CGContextFillRect (myContext, CGRectMake(0,0,100,200));
   */
    // PDF Graphics Context
    CGRect mediaBox;
    int myPageWidth = 320;
    int myPageHeight = 460;
    mediaBox = CGRectMake(0, 0, myPageWidth, myPageHeight);

    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *stringPath = [NSString stringWithFormat:@"%@/TestPage.pdf",documentsDirectory];
    NSLog(@"%@",documentsDirectory);
 
    CFStringRef path =  (__bridge CFStringRef) stringPath;

    CGContextRef myPDFContext = MyPDFContextCreate(&mediaBox,path);
    CFStringRef myKeys[1];
    CFTypeRef myValues[1];
    myKeys[0] = kCGPDFContextMediaBox;
    myValues[0] = (CFTypeRef) CFDataCreate(NULL, (const UInt8 *)&mediaBox, sizeof(CGRect));
    CFDictionaryRef pageDictionary = CFDictionaryCreate(NULL, (const void **)myKeys,(const void **)myValues,1,&kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    /*
    CGPDFContextBeginPage(myPDFContext, pageDictionary);
    //UIGraphics
    CGContextSetRGBFillColor(myPDFContext, 1, 0, 0, 1);
    CGContextFillRect(myPDFContext, CGRectMake(0,0,200,100));
    CGContextSetRGBFillColor(myPDFContext,0,0,1,1);
    CGContextFillRect (myPDFContext, CGRectMake(0,0,100,200));
    
    CGPDFContextEndPage(myPDFContext);
    CFRelease(pageDictionary);
    CFRelease(myValues[0]);
    CGContextRelease(myPDFContext);
    */
    // Open PDF Document
    
    //CFStringRef path;
    CFURLRef url;
    CGPDFDocumentRef myDocument;
    
    url = CFURLCreateWithFileSystemPath(NULL, path,kCFURLPOSIXPathStyle,0);
    CFRelease(path);
    int pageNum;
    myDocument = CGPDFDocumentCreateWithURL(url);
    if (myDocument == NULL) {
        //error("can't open '%s'.",filename);
        NSLog(@"Can't open %@",path);
    }
    CFRelease(url);
    pageNum = CGPDFDocumentGetNumberOfPages(myDocument);
    if (pageNum == 0) {
        NSLog(@"%@ need at least one page", path);
    } 
    
    CGPDFPageRef page;
    
    int pageNumber = 0;
    //Gets the page for the specified page nubmer from the PDF document
    page = CGPDFDocumentGetPage(myDocument, pageNumber);
    
    //Draws the specified page from the PDF file by calling the function CGContextDrawPDFPage. You need to supply a graphics context and the page to draw
    CGContextDrawPDFPage (myPDFContext, page);

    CGPDFDocumentRelease(myDocument);
    
    
}
/*
// Use Core Text to draw the text in a frame on the page.
- (CFRange)renderPage:(NSInteger)pageNum
        withTextRange:(CFRange)currentRange
       andFramesetter:(CTFramesetterRef)framesetter
{
    // Get the graphics context.
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    // Create a path object to enclose the text. Use 72 point
    // margins all around the text.
    CGRect    frameRect = CGRectMake(72, 72, 468, 648);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    // Get the frame that will do the rendering.
    // The currentRange variable specifies only the starting point. The framesetter
    // lays out as much text as will fit into the frame.
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange,
                                                   framePath, NULL);
    CGPathRelease(framePath);
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 792);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    // Update the current range based on what was drawn.
    currentRange = CTFrameGetVisibleStringRange(frameRef);
    currentRange.location += currentRange.length;
    currentRange.length = 0;
    CFRelease(frameRef);
    return currentRange;
}
 */
/*
- (void)drawPageNumber:(NSInteger)pageNum
{
    NSString *pageString = [NSString stringWithFormat:@"Page %d", pageNum];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = CGSizeMake(612, 72);
    CGSize pageStringSize = [pageString sizeWithFont:theFont
                                   constrainedToSize:maxSize
                                       lineBreakMode:UILineBreakModeClip];
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0),
                                   720.0 + ((72.0 - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    [pageString drawInRect:stringRect withFont:theFont];
}
 */
// Creating a CGPDFDocument object from a PDF file
CGPDFDocumentRef MyGetPDFDocumentRef (const char *filename)
{
    CFStringRef path;
    CFURLRef url;
    CGPDFDocumentRef document;
    size_t count;
    
    path = CFStringCreateWithCString (NULL, filename,kCFStringEncodingUTF8);
    
    //Calls the Core Foundation function to create a CFURL object from a CFString object that represents the filename of the PDF file to display
    url = CFURLCreateWithFileSystemPath(NULL, path,kCFURLPOSIXPathStyle,0);
    CFRelease(path);
    
    //Creates a CGPDFDocument object from a CFURL object.
    document = CGPDFDocumentCreateWithURL(url);
    CFRelease(url);
    
    //Gets the number of pages in the PDf so that the next statement in the code can ensure that the document has at least one page
    count = CGPDFDocumentGetNumberOfPages(document);
    if (count == 0) {
        printf("%s needs at least one page!", filename);
        return NULL;
    }
    return document;
}

// Drawing a PDF page
void MyDisplayPDFPage (CGContextRef myContext, size_t pageNumber, const char *filename)
{
    CGPDFDocumentRef document;
    CGPDFPageRef page;
    
    // Calls your function to create CGPDFDocoment object from a filename you supply
    document = MyGetPDFDocumentRef(filename);
    
    //Gets the page for the specified page nubmer from the PDF document
    page = CGPDFDocumentGetPage(document, pageNumber);
    
    //Draws the specified page from the PDF file by calling the function CGContextDrawPDFPage. You need to supply a graphics context and the page to draw
    CGContextDrawPDFPage (myContext, page);
    
    //Releases the CGPDFDocument object.
    CGPDFDocumentRelease(document);
}

// Creating an affine transform for a PDF page
void MyDrawPDFPageInRect(CGContextRef context, CGPDFPageRef page,
                         CGPDFBox box,
                         CGRect rect,
                         int rotation,
                         bool preserveAspectRatio)
{
    CGAffineTransform m;
    // Create an affine transform with the affine transform
    m = CGPDFPageGetDrawingTransform (page, box,rect, rotation,preserveAspectRatio);
    
    // Saves the graphics state
    CGContextSaveGState(context);
    
    //Concatenates the CTM with the affine transform
    CGContextConcatCTM(context, m);
    
    // Clips the graphics context to the rectangle specified by the box parameter. The function CGPDFPageGetBoxRect obtains the page bounding box(media, crop, bleed, trim, and art boxes)associated with the constant you supply - kCGPDFMediaBox, kCGPDFCropBox, kCGPDFBleedBox, kCGPDFTrimBox, or kCGPDFArtBox
    CGContextClipToRect(context, CGPDFPageGetBoxRect(page,box));
    
    // Draws the PDF page to the transformed and clipped context
    CGContextDrawPDFPage(context, page);
    
    //Restores the graphics state.
    CGContextRestoreGState(context);
}

/*
// Creating a PDF File
void MyCreatePDFFile (CGRect pageRect, const char *filename)
{
    //Takes as parameters a rectangle that specifies the size of the PDF page and a string that specifies the filename.
    CGContextRef pdfContext;
    CFStringRef path;
    CFURLRef url;
    CFDataRef boxData = NULL;
    CFMutableDictionaryRef myDictionary = NULL;
    CFMutableDictionaryRef pageDictionary = NULL;
    
    //Creates a CFString object from a filename passed to the function MyCreatePDFFile.
    path = CFStringCreateWithCString(NULL, filename, kCFStringEncodingUTF8);
    
    //Creates a CFURL object from the CFString object
    url = CFURLCreateWithFileSystemPath(NULL, path, kCFURLPOSIXPathStyle, 0);
    
    CFRelease(path);
    
    //Creates an empty CFDictionary object to hold metadata. The next two lines add a title and creator. You can add as many key-value pairs as you’d like using the function CFDictionarySetValue. For more information on creating dictionaries, see CFDictionary Reference .
    myDictionary = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(myDictionary, kCGPDFContextTitle, CFSTR("My PDF File"));
    CFDictionarySetValue(myDictionary, kCGPDFContextCreator, CFSTR("My Name"));
   */ 
    /*
    Creates a PDF graphics context, passing three parameters:
     
        A CFURL object that specifies a location for the PDF data.
     
        A pointer to a rectangle that defines the default size and location of the PDF page. The origin of the rectangle is typically (0, 0). Quartz uses this rectangle as the default bounds of the page media box. If you pass NULL, Quartz uses a default page size of 8.5 by 11 inches (612 by 792 points).
     
        A CFDictionary object that contains PDF metadata. Pass NULL if you don’t have metadata to add.
            You can use the CFDictionary object to specify output intent options—intent subtype, condition, condition identifier, registry name, destination output profile, and a human-readable text string that contains additional information or comments about the intended target device or production condition. For more information about output intent options, see CGPDFContext Reference .
     */
/*
    pdfContext = CGPDFContextCreateWithURL(url, &pageRect, myDictionary);
    CFRelease(myDictionary);
    CFRelease(url);
    
    //Creates a CFDictionary object to hold the page boxes for the PDF page. This example sets the media box.
    pageDictionary = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    boxData = CFDataCreate(NULL, (const UInt8 * )&pageRect,sizeof(CGRect));
    CFDictionarySetValue(pageDictionary, kCGPDFContextMediaBox, boxData);
    
    // Signals the start of a page. When you use a graphics context that supports multiple pages (such as PDF), you call the function CGPDFContextBeginPage together with CGPDFContextEndPage to delineate the page boundaries in the output. Each page must be bracketed by calls to CGPDFContextBeginPage and CGPDFContextEndPage. Quartz ignores all drawing operations performed outside a page boundary in a page-based context.
    
    CGPDFContextBeginPage(pdfContext, &pageRect);
    
    //Calls an application-defined function to draw content to the PDF context. You supply your drawing routine here.
    myDrawContent(pdfContext);
    
    //Signals the end of a page in a page-based graphics context.
    CGPDFContextEndPage(pdfContext);
    
    //Releases the PDF context.
    CGContextRelease(pdfContext);
    
    //Releases the page dictionary.
    CFRelease(pageDictionary);
    CFRelease(boxData);
}
*/
// PDF Document Parsing

@end
