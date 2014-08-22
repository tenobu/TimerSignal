//
//  NTClockGestureRecognizer.h
//  TimerSample01
//
//  Created by ビザンコムマック０９ on 2014/08/06.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@protocol NTClockGestureRecognizerDelegate < NSObject >

@optional

- (void)rotation  : (CGFloat) angle;
- (void)finalAngle: (CGFloat) angle;

@end

@interface NTClockGestureRecognizer : UIGestureRecognizer
{
	
	CGPoint midPoint;
	CGFloat innerRadius;
	CGFloat outerRadius;
	CGFloat cumulatedAngle;
	
	id < NTClockGestureRecognizerDelegate > target;
	
}

- (id) initWithRect: (CGRect) rect
			 target: (id) target;

- (void)reset;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

// private helper functions
CGFloat distanceBetweenPoints(CGPoint point1, CGPoint point2);
CGFloat angleBetweenLinesInDegrees(CGPoint beginLineA,
                                   CGPoint endLineA,
                                   CGPoint beginLineB,
                                   CGPoint endLineB);

@end
