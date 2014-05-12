//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Ram Periathiruvadi on 5/10/14.
//  Copyright (c) 2014 RamPerry. All rights reserved.
//
// Settings View : Loads a UIView with a UITableView that lets the user choose
// the default tip percentage
//

#import "SettingsViewController.h"
#import "TipOptionsTable.h"

@interface SettingsViewController ()
// The delegate and data source object for the UITableView
@property (strong, nonatomic) TipOptionsTable *tipDelegate;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"Settings"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the tipOptions UITableView
    CGRect tipTableFrame = CGRectMake(150, 100, 150, 150);
    self.tipOptions = [[UITableView alloc] initWithFrame:tipTableFrame];
    [self.tipOptions setBackgroundColor:[UIColor lightGrayColor]];
    [self.tipOptions setSeparatorColor:[UIColor lightGrayColor]];
    
    // Set the tipOptions Label
    CGRect labelFrame = CGRectMake(40, 100, 100, 50);
    self.optionLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [self.optionLabel setText:@"Default Tip"];
    
    // Set the data source and delegate for the UITableView
    self.tipDelegate = [[TipOptionsTable alloc] init];
    [self.tipOptions setDelegate:self.tipDelegate];
    [self.tipOptions setDataSource:self.tipDelegate];
    
    // Add them to the view
    [self.view addSubview:self.tipOptions];
    [self.view addSubview:self.optionLabel];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
