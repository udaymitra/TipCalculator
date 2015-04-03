//
//  TipViewController.m
//  TipCalculator
//
//  Created by Soumya on 3/26/15.
//  Copyright (c) 2015 udaymitra. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"
#import "UserSettings.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentValue;
@property (weak, nonatomic) IBOutlet UILabel *firstSplitLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondSplitLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdSplitLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstSplitValue;
@property (weak, nonatomic) IBOutlet UILabel *secondSplitValue;
@property (weak, nonatomic) IBOutlet UILabel *thirdSplitValue;
@property UserSettings *userSettings;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

    self.userSettings = [[UserSettings alloc] init];
    [self.userSettings updateFromDefaults];
    
    // if user used the app in the last 10 mins load the last entered bill amount
    NSDate *now = [NSDate date];
    NSTimeInterval secs = [now timeIntervalSinceDate:self.userSettings.lastUsedDate];
    if (secs < 600) {
        self.billTextField.text = [NSString stringWithFormat:@"%0.2lf", self.userSettings.lastEnteredBillAmount];
    } else {
        self.userSettings.lastEnteredBillAmount = 0; // clear the last entered bill amount
    }
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {
    [self updateValues];
    [self.view endEditing:YES];
}

- (void)updateValues {
    [self setResultsVisibility];
    float billValue = [self.billTextField.text floatValue];
    int tipPercentValue = (int) self.tipPercentSlider.value;
    float tipAmount = billValue * tipPercentValue / 100.0;
    float totalAmount = billValue + tipAmount;
    
    self.tipPercentValue.text = [NSString stringWithFormat:@"%d%%", tipPercentValue];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];

    float split1Amount = totalAmount / self.userSettings.split1Value;
    float split2Amount = totalAmount / self.userSettings.split2Value;
    float split3Amount = totalAmount / self.userSettings.split3Value;
    
    self.firstSplitLabel.text = [NSString stringWithFormat:@"%d splits", self.userSettings.split1Value];
    self.secondSplitLabel.text = [NSString stringWithFormat:@"%d splits", self.userSettings.split2Value];
    self.thirdSplitLabel.text = [NSString stringWithFormat:@"%d splits", self.userSettings.split3Value];

    self.firstSplitValue.text = [NSString stringWithFormat:@"$%0.2f", split1Amount];
    self.secondSplitValue.text = [NSString stringWithFormat:@"$%0.2f", split2Amount];
    self.thirdSplitValue.text = [NSString stringWithFormat:@"$%0.2f", split3Amount];
    
    self.userSettings.lastEnteredBillAmount = billValue;
    [self.userSettings writeDefaults];
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.userSettings updateFromDefaults];
    self.tipPercentSlider.value = self.userSettings.defaultTipPercent;
    [self updateValues];
}

- (void)setResultsVisibility {
    BOOL hide =[self.billTextField.text length] == 0 ||
                !([self.billTextField.text floatValue] > 0);
    [self.tipAmountLabel setHidden:hide];
    [self.totalLabel setHidden:hide];
    [self.firstSplitLabel setHidden:hide];
    [self.firstSplitValue setHidden:hide];
    [self.secondSplitLabel setHidden:hide];
    [self.secondSplitValue setHidden:hide];
    [self.thirdSplitLabel setHidden:hide];
    [self.thirdSplitValue setHidden:hide];
}

@end
