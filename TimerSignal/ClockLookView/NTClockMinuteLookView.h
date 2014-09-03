//
//  NTClockMinuteLookView.h
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/03.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockHariLookView.h"

#import "NTClockGestureRecognizer.h"
#import "NTClockRecognizer.h"

@interface NTClockMinuteLookView : NTClockHariLookView < NTClockGestureRecognizerDelegate >

@property NTClockRecognizer *clockRecognizer;
@property NSInteger integer_Minute;

- (void)time: (NSInteger)_minute;

@end
