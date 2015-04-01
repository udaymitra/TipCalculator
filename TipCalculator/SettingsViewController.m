//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Soumya on 3/29/15.
//  Copyright (c) 2015 udaymitra. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *defaultTipSlider;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipValue;
@property (weak, nonatomic) IBOutlet UIStepper *split1Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *split2Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *split3Stepper;
@property (weak, nonatomic) IBOutlet UILabel *split1Value;
@property (weak, nonatomic) IBOutlet UILabel *split2Value;
@property (weak, nonatomic) IBOutlet UILabel *split3Value;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)storeDefaults;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self updateValues];
}

- (void)updateValues {
    int defaultTipPercent = [self.defaultTipSlider value];
    int split1StepperValue = [self.split1Stepper value];
    int split2StepperValue = [self.split2Stepper value];
    int split3StepperValue = [self.split3Stepper value];
    
    self.defaultTipValue.text = [NSString stringWithFormat:@"%d%%", defaultTipPercent];
    self.split1Value.text = [NSString stringWithFormat:@"%d", split1StepperValue];
    self.split2Value.text = [NSString stringWithFormat:@"%d", split2StepperValue];
    self.split3Value.text = [NSString stringWithFormat:@"%d", split3StepperValue];
    
    [self storeDefaults:defaultTipPercent:split1StepperValue:split2StepperValue:split3StepperValue];
}

- (void)storeDefaults:(int)defaultTipPercent :(int)split1Value :(int)split2Value :(int)split3Value {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTipPercent forKey:@"defaultTipPercent"];
    [defaults setInteger:split1Value forKey:@"split1Value"];
    [defaults setInteger:split2Value forKey:@"split2Value"];
    [defaults setInteger:split3Value forKey:@"split3Value"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipPercent = [defaults integerForKey:@"defaultTipPercent"];
    int split1Value = [defaults integerForKey:@"split1Value"];
    int split2Value = [defaults integerForKey:@"split1Value"];
    int split3Value = [defaults integerForKey:@"split1Value"];
    
    self.defaultTipSlider.value = defaultTipPercent;
    self.split1Stepper.value = split1Value;
    self.split2Stepper.value = split2Value;
    self.split3Stepper.value = split3Value;
    
    [self updateValues];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
