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
- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;
- (int) loadSettings;
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
    NSLog(@"view will appear");
    int selectedIndex = [self loadSettings];
    NSLog(@"sel ind : %d", selectedIndex);
    [self.tipControl setSelectedSegmentIndex:selectedIndex];

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
    //[self.totalLabelField setText:[NSString stringWithFormat:@"$%0.2f", totalAmount]];
    [self.totalLabelField setText:[NSString stringWithFormat:@"$%d", (int)(totalAmount+1)]];
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


- (int) loadSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"selectedTipIndex"];
    NSLog(@"default Index : %d", intValue);
    return intValue;
}

@end
