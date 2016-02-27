//
//  CV_lineDrawer.m
//  DraWave
//
//  Created by alexanderbollbach on 2/25/16.
//  Copyright © 2016 alexanderbollbach. All rights reserved.
//

#import "KS_LineDrawer.h"

@interface KS_LineDrawer()
@property (nonatomic) float dashConstant1;
@end

@implementation KS_LineDrawer


- (instancetype)initWithFrame:(CGRect)frame {
   if (self = [super initWithFrame:frame]) {
      
      self.clearsContextBeforeDrawing = YES;
      self.backgroundColor = [UIColor clearColor];
      self.userInteractionEnabled = NO;
      
      self.dashConstant1 = 1;
      
      [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(time) userInfo:nil repeats:YES];
   }
   return self;
}

- (void)time {
   self.dashConstant1 -= 3;
   [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
   

   CGContextRef context = UIGraphicsGetCurrentContext();
   
   CGFloat val[2] = { 4,5 };
   CGContextSetLineDash(context, self.dashConstant1, val, 2);
   
   if (self.drawChoosingLine) {
      CGContextMoveToPoint(context, self.chosenGesturePoint.x,self.chosenGesturePoint.y);
      CGContextAddLineToPoint(context, self.currentPoint.x, self.currentPoint.y);
   }
   
   if (self.KS_X1_ISConnected) {
      CGContextMoveToPoint(context, self.KS_X1_From.x, self.KS_X1_From.y);
      CGContextAddLineToPoint(context, self.KS_X1_To.x, self.KS_X1_To.y);
   }
   if (self.KS_Y1_ISConnected) {
      CGContextMoveToPoint(context, self.KS_Y1_From.x, self.KS_Y1_From.y);
      CGContextAddLineToPoint(context, self.KS_Y1_To.x, self.KS_Y1_To.y);
   }
   if (self.KS_X2_ISConnected) {
      CGContextMoveToPoint(context, self.KS_X2_From.x, self.KS_X2_From.y);
      CGContextAddLineToPoint(context, self.KS_X2_To.x, self.KS_X2_To.y);
   }
   if (self.KS_Y2_ISConnected) {
      CGContextMoveToPoint(context, self.KS_Y2_From.x, self.KS_Y2_From.y);
      CGContextAddLineToPoint(context, self.KS_Y2_To.x, self.KS_Y2_To.y);
   }

   
   
   CGContextSetLineWidth(context, 1.0f);
   [[UIColor whiteColor] setStroke];
   CGContextDrawPath(context,kCGPathFillStroke);
   
}


@end