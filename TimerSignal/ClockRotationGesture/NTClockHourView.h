//
//  NTClockHourView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/29.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockHariView.h"

#import "NTClockGestureRecognizer.h"
#import "NTClockRecognizer.h"

@interface NTClockHourView : NTClockHariView < NTClockGestureRecognizerDelegate >

@property NTClockRecognizer *clockRecognizer;
@property NSInteger integer_Hour;

- (void)time: (NSInteger)_hour;

@end
