//
//  DrawView.m
//  DrawingBasics
//
//  Created by Thanh Dao on 5/16/13.
//  Copyright (c) 2013 Thanh Dao. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(myContext, 1.0,1.0,1.0,1.0);
    CGContextFillRect(myContext, rect);
    //doSimpleRect(myContext);
    //doStrokedRect(myContext);
    //doStrokedAndFilledRect(myContext);
    //doPathRects(myContext);
    //doAlphaRects(myContext);
    doDashedLines(myContext);
    
}
void doSimpleRect(CGContextRef context) {
    CGRect ourRect;
    //Set the fill color to opaque red.
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    // Set up the rectangle for drawing.
    ourRect.origin.x = ourRect.origin.y = 20.0;
    ourRect.size.width = 130.0;
    ourRect.size.height = 100.0;
    
    //Transform coordinate system
    CGContextTranslateCTM(context, 0, 480);
    CGContextScaleCTM(context, 1.0, -1.0);
    // Draw the filled rectangle.

    CGContextFillRect(context, ourRect);

}

void doStrokedRect(CGContextRef context){
    CGRect ourRect;
    // Set the stroke color to light opaque blue
    CGContextSetRGBStrokeColor(context, 0.482, 0.62, 0.871,1);
    // Set up the rectangle for drawing
    ourRect.origin.x = ourRect.origin.y = 20;
    ourRect.size.width = 130.0;
    ourRect.size.height = 100.0;
    // Transform coordinate system
    CGContextTranslateCTM(context, 0, 460);
    CGContextScaleCTM(context, 1.0, -1.0);
    // Draw the stroked rectangle with a line width of 3
    CGContextStrokeRectWithWidth(context,ourRect,8.0);
    
}

void doStrokedAndFilledRect(CGContextRef context){
    CGRect ourRect = {{20,20},{100,80}};
    
    // Rectangle 1
    // Set the fill color to a light opaque blue.
    CGContextSetRGBFillColor(context, 0.482, 0.62, 0.871,1);
    // Set the stroke color to an opaque green
    CGContextSetRGBStrokeColor(context,0.404,0.808,0.239,1);
    // Transform coordinate system
    // CGContextTranslateCTM(context, 0, 60);
    // CGContextScaleCTM(context, 1.0, 1.5);
     CGContextRotateCTM(context, 170);

    // Fill the rectangle
    CGContextFillRect(context, ourRect);
    
    // Rectangle 2
    // Move the rectangle's origin to the right by 200
    ourRect.origin.x += 150;
    // Stroke the rectangle with a line width of 10.0
    CGContextStrokeRectWithWidth(context, ourRect, 10);
    
    // Rectangle 3
    // Move the rectangle's origin to the left by 200 units
    // and down by 200
    ourRect.origin.x -= 150;
    ourRect.origin.y += 150;
    // Fill then stroke the rectangle with a line width of 10
    CGContextFillRect(context, ourRect);
    CGContextStrokeRectWithWidth(context, ourRect, 10);
    
    // Rectangle 4
    // Move the rectangle's origin to the right by 200
    ourRect.origin.x += 150;
    // Stroke then fill the rectangle.
    CGContextStrokeRectWithWidth(context, ourRect, 10);
    CGContextFillRect(context, ourRect);
    
}

void createRectPath(CGContextRef context, CGRect rect){
    
    // Create a path using the coordinates of the rect passed in.
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    // Segment 1
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
    
    // Segment 2
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    
    // Segment 3
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height);
    
    // Segment 4
    CGContextClosePath(context);
}

void doPathRects(CGContextRef context){
    
    // Define a rectangle to use for drawing
    CGRect ourRect = {{22,220},{130,100}};
    
    // ******** Rectangle 1 ********
    // Create the rect path.
    createRectPath(context, ourRect);
    // Set the fill color to a light
    CGContextSetRGBFillColor(context, 0.482, 0.62, 0.871, 1.0);
    CGContextDrawPath(context,kCGPathFill);
    
    // ******** Rectangle 2 ********
    // Translate the coordinate system 200 unit to the right
    CGContextTranslateCTM(context, 150,0);
    // Set Stroke color to an opague green
    CGContextSetRGBStrokeColor(context, 0.404, 0.808,0.239,1.0);
    createRectPath(context, ourRect);
    // Set the line width to 10
    CGContextSetLineWidth(context, 10);
    // Stroke the path
    CGContextDrawPath(context,kCGPathStroke);
    
    // ******** Rectangle 3 ********
    // Translate the coordinate system
    // 200 unit to the left and 200 unit down
    CGContextTranslateCTM(context, -150, -150);
    createRectPath(context, ourRect);
    // CGContextSetLineWidth(context, 10);
    // Fill, then stroke the path
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // ******* Rectangle 4 *******
    // Translate the coordinate system 200 unit to the right
    CGContextTranslateCTM(context, 150, 0);
    createRectPath(context, ourRect);
    // Stroke the path
    CGContextDrawPath(context, kCGPathStroke);
    // Create the path again
    createRectPath(context, ourRect);
    // Fill the path
    CGContextDrawPath(context, kCGPathFill);
}

void doAlphaRects(CGContextRef context){
    // ***** Part 1 *****
    CGRect ourRect = {{0,0},{90,100}};
    int i, numRects = 6;
    float rotateAngle = 2*M_PI/numRects;
    float tint, tintAdjust = 1.0/numRects;
    
    // ***** Part 2 *****
    // First fill the background with white.
 

    CGContextTranslateCTM(context, 2 * ourRect.size.width, 2 * ourRect.size.height);
    // ***** Part 3 *****
    for (i = 0, tint = 0.0; i < numRects; i ++, tint += tintAdjust) {
    
        CGContextSetRGBFillColor(context, tint, 0, 0, tint);
        CGContextFillRect(context, ourRect);
        CGContextRotateCTM(context, rotateAngle);
    }
    
    
}

void drawStrokedLine(CGContextRef context, CGPoint start, CGPoint end){
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, start.x, start.y);
    CGContextAddLineToPoint(context, end.x, end.y);
    CGContextDrawPath(context, kCGPathStroke);
}

void doDashedLines(CGContextRef context){
    CGPoint start, end;
    start.x = 20.; start.y = 270.;
    float lengths[6] = {12.0, 6.0, 5.0, 6.0, 5.0, 6.0};
    end.x = 300.; end.y = 270;
    // ***** Line 1 solid line *****
    CGContextSetLineWidth(context,5);
    drawStrokedLine(context, start, end);
    
    // ***** Line 2 long dashes
    CGContextTranslateCTM(context, 0, -50);
    CGContextSetLineDash(context, 0, lengths, 2);
    drawStrokedLine(context, start, end);
    
    // ***** Line 3 long short pattern
    CGContextTranslateCTM(context,0, -50);
    CGContextSetLineDash(context, 0, lengths, 4);
    drawStrokedLine(context, start, end);
    
    // ***** Line 4 long short short pattern *****
    CGContextTranslateCTM(context, 0, -50);
    CGContextSetLineDash(context, 0, lengths,6);
    drawStrokedLine(context, start, end);
    
    // ***** Line 5 short short long pattern *****
    CGContextTranslateCTM(context, 0, -50);
    CGContextSetLineDash(context, lengths[0] + lengths[1], lengths,6);
    drawStrokedLine(context, start, end);
    
    // ***** Line 6 short short long pattern *****
    CGContextTranslateCTM(context, 0, -50);
    CGContextSetLineDash(context, 0, NULL, 0);
    drawStrokedLine(context, start, end);

}

void doClippedCircle(CGContextRef context){
    CGPoint circleCenter = {150, 150};
    float circleRadius = 100;
    
}
@end
