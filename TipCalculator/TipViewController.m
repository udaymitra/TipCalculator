//
//  TipViewController.m
//  TipCalculator
//
//  Created by Soumya on 3/26/15.
//  Copyright (c) 2015 udaymitra. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentValue;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
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

- (void) updateValues {
    float billValue = [self.billTextField.text floatValue];
    int tipPercentValue = (int) self.tipPercentSlider.value;
    float tipAmount = billValue * tipPercentValue / 100.0;
    float totalAmount = billValue + tipAmount;

    self.tipPercentValue.text = [NSString stringWithFormat:@"%d%%", tipPercentValue];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void) onSettingsButton {
    
}

@end
