//
//  NTT1thViewController.h
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/01.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockString.h"
#import "NTClockView.h"

@interface NTT1thViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label_End_AmPm;
@property (weak, nonatomic) IBOutlet UILabel *label_End_HHMM;
@property (weak, nonatomic) IBOutlet NTClockView *clockView_End;

@end
