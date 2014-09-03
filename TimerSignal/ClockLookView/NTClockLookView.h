//
//  NTClockLookView.h
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/03.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockHourLookView.h"
#import "NTClockMinuteLookView.h"

@protocol NTClockLookViewDelegate < NSObject >

@optional

- (void)time: (NSString *)_startEnd;

@end

@interface NTClockLookView : UIView < NTClockRecognizerDelegate >

@property (weak, nonatomic) IBOutlet UIButton *button_AmPm;
@property (weak, nonatomic) IBOutlet NTClockHourLookView   *imageView_Hour;
@property (weak, nonatomic) IBOutlet NTClockMinuteLookView *imageView_Minute;

@property (nonatomic, assign) id < NTClockLookViewDelegate > delegate;

@property NSString *string_StartEnd;

@property NSDate *date_DateTime;
@property NSString *string_Time, *string_TimeNow;
@property NSString *string_AmPm, *string_HHMM;
@property NSInteger integer_AmPm, integer_Hour, integer_Minute;

- (void)time;

@end
