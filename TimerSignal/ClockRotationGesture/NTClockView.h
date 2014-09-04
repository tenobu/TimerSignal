//
//  NTClockView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockHourView.h"
#import "NTClockMinuteView.h"

@protocol NTClockViewDelegate < NSObject >

@optional

- (void)time: (NSString *)_startEnd;

@end

@interface NTClockView : UIView < NTClockRecognizerDelegate >

@property (weak, nonatomic) IBOutlet UIButton *button_AmPm;
@property (weak, nonatomic) IBOutlet NTClockHourView   *imageView_Hour;
@property (weak, nonatomic) IBOutlet NTClockMinuteView *imageView_Minute;

@property (nonatomic, assign) id < NTClockViewDelegate > delegate;

@property NSString *string_StartEnd;

@property NSDate *date_DateTime;
@property NSString *string_Time, *string_TimeNow;
@property NSString *string_Date, *string_AmPm, *string_HHMM;
@property NSInteger integer_AmPm, integer_Hour, integer_Minute;

- (void)time;

@end
