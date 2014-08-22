//
//  NTClockAmPmView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/17.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockRecognizer.h"

@interface NTClockAmPmView : UIView

@property NTClockRecognizer *clockRecognizer;
@property NSInteger integerAmPm;

@property (weak, nonatomic) IBOutlet UIButton *button_AmPm;

@end
