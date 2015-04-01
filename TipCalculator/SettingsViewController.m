//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Soumya on 3/29/15.
//  Copyright (c) 2015 udaymitra. All rights reserved.
//

#import "SettingsViewController.h"
#import "UserSettings.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *defaultTipSlider;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipValue;
@property (weak, nonatomic) IBOutlet UIStepper *split1Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *split2Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *split3Stepper;
@property (weak, nonatomic) IBOutlet UILabel *split1Value;
@property (weak, nonatomic) IBOutlet UILabel *split2Value;
@property (weak, nonatomic) IBOutlet UILabel *split3Value;
@property UserSettings *userSettings;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)storeDefaults;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userSettings = [[UserSettings alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self updateValues];
}

- (void)updateValues {
    self.userSettings.defaultTipPercent = [self.defaultTipSlider value];
    self.userSettings.split1Value = [self.split1Stepper value];
    self.userSettings.split2Value = [self.split2Stepper value];
    self.userSettings.split3Value = [self.split3Stepper value];
    
    self.defaultTipValue.text = [NSString stringWithFormat:@"%d%%", self.userSettings.defaultTipPercent];
    self.split1Value.text = [NSString stringWithFormat:@"%d", self.userSettings.split1Value];
    self.split2Value.text = [NSString stringWithFormat:@"%d", self.userSettings.split2Value];
    self.split3Value.text = [NSString stringWithFormat:@"%d", self.userSettings.split3Value];
    
    [self.userSettings writeDefaults];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.userSettings updateFromDefaults];
    
    self.defaultTipSlider.value = self.userSettings.defaultTipPercent;
    self.split1Stepper.value = self.userSettings.split1Value;
    self.split2Stepper.value = self.userSettings.split2Value;
    self.split3Stepper.value = self.userSettings.split3Value;
    
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
