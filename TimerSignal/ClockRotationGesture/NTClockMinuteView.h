//
//  NTClockMinuteView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockHariView.h"

#import "NTClockGestureRecognizer.h"
#import "NTClockRecognizer.h"

@interface NTClockMinuteView : NTClockHariView < NTClockGestureRecognizerDelegate >

@property NTClockRecognizer *clockRecognizer;
@property NSInteger integer_Minute;

- (void)time: (NSInteger)_minute;

@end
