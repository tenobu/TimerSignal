//
//  NTSignalViewController.h
//  TimeSignal
//
//  Created by ビザンコムマック０９ on 2014/07/10.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockString.h"
#import "NTClockView.h"
#import "NTClockLookView.h"
#import "NTClockRunView.h"
#import "NTClockStopView.h"

@interface NTSignalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label_Start_HHMM;
@property (weak, nonatomic) IBOutlet UILabel *label_Start_AmPm;
@property (weak, nonatomic) IBOutlet NTClockRunView *clockView_Start;
@property (weak, nonatomic) IBOutlet UILabel *label_End_AmPm;
@property (weak, nonatomic) IBOutlet UILabel *label_End_HHMM;
@property (weak, nonatomic) IBOutlet NTClockStopView *clockView_End;

@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *stopLabel;

@end
