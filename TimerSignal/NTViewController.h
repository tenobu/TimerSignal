//
//  NTViewController.h
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/08/22.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClockRotationGesture/NTClockString.h"

@class NTClockView;

@interface NTViewController : UIViewController < NTClockStringDelegate >

@property (weak, nonatomic) IBOutlet UILabel *label_StartTime;
@property (weak, nonatomic) IBOutlet NTClockView *clock_StartTime;

@property (weak, nonatomic) IBOutlet UILabel *label_EndTime;
@property (weak, nonatomic) IBOutlet NTClockView *clock_EndTime;

@end
