//
//  WaveFormView.m
//  WavformVizualizer_iOS
//
//  Created by alexanderbollbach on 2/14/16.
//  Copyright © 2016 alexanderbollbach. All rights reserved.
//

#import "WaveFormOverlayView.h"
#import "functions.h"
#import "AudioController.h"

@implementation WaveFormOverlayView
- (instancetype)initWithFrame:(CGRect)frame {
   if (self = [super initWithFrame:frame]) {
      self.opaque = NO;
      self.clearsContextBeforeDrawing = YES;
      self.userInteractionEnabled = NO;
      self.backgroundColor = [UIColor clearColor];
   }
   return self;
}


- (void)drawRect:(CGRect)rect {
   [super drawRect:rect];
   
   UIBezierPath * pathS = [UIBezierPath bezierPath];
   UIBezierPath * pathE = [UIBezierPath bezierPath];
   
   float w = CGRectGetWidth(self.bounds);
   float h = CGRectGetHeight(self.bounds);

   
   // start
   [pathS moveToPoint:CGPointMake(self.xPosition, 0)];
   [pathS addLineToPoint:CGPointMake(self.xPosition, h)];
   
   [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8] set];
   [pathS setLineWidth:2];
   [pathS stroke];
   
   
   // end
   [pathE moveToPoint:CGPointMake(0, self.yPosition)];
   [pathE addLineToPoint:CGPointMake(w, self.yPosition)];
   
   [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8] set];
   [pathE setLineWidth:1];
   [pathE stroke];
   
   //string
   NSDictionary * textAttributes = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:10.0], NSForegroundColorAttributeName : [UIColor blackColor],
                                      NSBackgroundColorAttributeName : [UIColor whiteColor]};
   
   NSStringDrawingContext *drawingContext = [[NSStringDrawingContext alloc] init];
   drawingContext.minimumScaleFactor = 1;
   
   CGRect panXStrRect = CGRectMake(self.xPosition + 2, CGRectGetHeight(self.bounds) * 0.9, 75, 15);
   [self.panXValReadOut drawWithRect:panXStrRect
                             options:NSStringDrawingUsesLineFragmentOrigin
                          attributes:textAttributes
                             context:drawingContext];
   
   
   
   CGRect panYStrRect = CGRectMake(w - 50, self.yPosition + 2, 75, 15);
   [self.panYValReadOut drawWithRect:panYStrRect
                             options:NSStringDrawingUsesLineFragmentOrigin
                          attributes:textAttributes
                             context:drawingContext];
   
}



- (void)setPanXValueReadOut:(NSString *)str {
   self.panXValReadOut = str;
}

- (void)setPanYValueReadOut:(NSString *)str {
   self.panYValReadOut = str;
}

- (void)setPanXPosition:(float)position {
   self.xPosition = position;
}
- (void)setPanYPosition:(float)position {
   self.yPosition = position;
}

@end
