//
//  tipViewController.m
//  TipCalculator
//
//  Created by Ram Periathiruvadi on 5/10/14.
//  Copyright (c) 2014 RamPerry. All rights reserved.
//

#import "tipViewController.h"
#import "SettingsViewController.h"
#import "TipOptionsTable.h"

@interface tipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabelField;
@property (strong, nonatomic) IBOutlet UILabel *totalLabelField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property BOOL roundUpReqd;
- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;
- (int) getSelectedSegmentIndex;
- (BOOL) isRoundUpNeeded;
@end

@implementation tipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"Tip Calculator"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    int selectedIndex = [self getSelectedSegmentIndex];
    [self.tipControl setSelectedSegmentIndex:selectedIndex];
    self.roundUpReqd = [self isRoundUpNeeded];
    

}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    float billAmount = [[[self billTextField] text] floatValue];
    
    NSArray *tipPercentages = @[@(0.1), @(0.15), @(0.2) ];
    
    float tipAmount = billAmount * [tipPercentages[[self.tipControl selectedSegmentIndex]] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    [self.tipLabelField setText:[NSString stringWithFormat:@"$%0.2f", tipAmount]];
    if([self roundUpReqd]){
        [self.totalLabelField setText:[NSString stringWithFormat:@"$%d", (int)(totalAmount+1)]];
    }
    else{
        [self.totalLabelField setText:[NSString stringWithFormat:@"$%0.2f", totalAmount]];
    }
    
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


- (int) getSelectedSegmentIndex {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"selectedTipIndex"];
    return intValue;
}

- (BOOL) isRoundUpNeeded {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"roundUpTotal"];
    return ((intValue)?YES:NO);
}

@end
