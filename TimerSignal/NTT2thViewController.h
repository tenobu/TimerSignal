//
//  NTT2thViewController.h
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/01.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockString.h"
#import "NTClockView.h"

@interface NTT2thViewController : UIViewController < NTClockStringDelegate >

@property (weak, nonatomic) IBOutlet UILabel *label_Start_HHMM;
@property (weak, nonatomic) IBOutlet UILabel *label_Start_AmPm;
@property (weak, nonatomic) IBOutlet NTClockView *clockView_Start;
@property (weak, nonatomic) IBOutlet UILabel *label_End_AmPm;
@property (weak, nonatomic) IBOutlet UILabel *label_End_HHMM;
@property (weak, nonatomic) IBOutlet NTClockView *clockView_End;

@end