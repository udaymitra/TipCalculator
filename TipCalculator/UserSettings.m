//
//  UserSettings.h
//  TipCalculator
//
//  Created by Soumya on 3/31/15.
//  Copyright (c) 2015 udaymitra. All rights reserved.
//

#import "UserSettings.h"

@interface UserSettings ()
@end


@implementation UserSettings

- (void)updateFromDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.defaultTipPercent = [defaults integerForKey:@"defaultTipPercent"];
    self.split1Value = [defaults integerForKey:@"split1Value"];
    self.split2Value = [defaults integerForKey:@"split2Value"];
    self.split3Value = [defaults integerForKey:@"split3Value"];
    self.lastEnteredBillAmount = [defaults floatForKey:@"lastEnteredBillAmount"];
    self.lastUsedDate = [defaults objectForKey:@"lastUsedDate"];
}

- (void)writeDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipPercent forKey:@"defaultTipPercent"];
    [defaults setInteger:self.split1Value forKey:@"split1Value"];
    [defaults setInteger:self.split2Value forKey:@"split2Value"];
    [defaults setInteger:self.split3Value forKey:@"split3Value"];
    [defaults setFloat:self.lastEnteredBillAmount forKey:@"lastEnteredBillAmount"];
    self.lastUsedDate = [NSDate date];
    [defaults setObject:self.lastUsedDate forKey:@"lastUsedDate"];
    [defaults synchronize];
}

@end

