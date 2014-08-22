//
//  NTClockAmPmView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/17.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockGestureRecognizer.h"
#import "NTClockRecognizer.h"

@interface NTClockAmPmView : UIView < NTClockGestureRecognizerDelegate >

@property (weak, nonatomic) IBOutlet UIImageView *amPm_ImageView;

@property NTClockRecognizer *clockRecognizer;
@property NSInteger integerAmPm;

@end
