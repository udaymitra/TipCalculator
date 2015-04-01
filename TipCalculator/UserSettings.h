//
//  UserSettings.h
//  TipCalculator
//
//  Created by Soumya on 3/31/15.
//  Copyright (c) 2015 udaymitra. All rights reserved.
//

#ifndef TipCalculator_UserSettings_h
#define TipCalculator_UserSettings_h

#import <Foundation/Foundation.h>

@interface UserSettings : NSObject
@property int defaultTipPercent;
@property int split1Value;
@property int split2Value;
@property int split3Value;

- (void)updateFromDefaults;
- (void)writeDefaults;
@end

#endif
