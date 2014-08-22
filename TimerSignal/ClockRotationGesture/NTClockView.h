//
//  NTClockView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockRecognizer.h"

@class NTClockAmPmView;
@class NTClockMinuteView;
@class NTClockHourView;
@class NTClockString;

@interface NTClockView : UIView < NTClockRecognizerDelegate >

@property (weak, nonatomic) IBOutlet NTClockAmPmView   *amPmView;
@property (weak, nonatomic) IBOutlet NTClockMinuteView *minuteView;
@property (weak, nonatomic) IBOutlet NTClockHourView   *hourView;

@property NTClockString *clockString;
@property NSString *stringTime;

@end
