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

+ (UserSettings)fromDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UserSettings settings = [UserSettings init];
    settings.defaultTipPercent = [defaults integerForKey:@"defaultTipPercent"];
    settings.split1Value = [defaults integerForKey:@"split1Value"];
    settings.split2Value = [defaults integerForKey:@"split2Value"];
    settings.split3Value = [defaults integerForKey:@"split3Value"];
}

- (id)init {
    return self;
}

- (void)writeDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipPercent forKey:@"defaultTipPercent"];
    [defaults setInteger:self.split1Value forKey:@"split1Value"];
    [defaults setInteger:self.split2Value forKey:@"split2Value"];
    [defaults setInteger:self.split3Value forKey:@"split3Value"];
    [defaults synchronize];
    
}

@end

#endif
