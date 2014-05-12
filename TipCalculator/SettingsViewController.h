//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Ram Periathiruvadi on 5/10/14.
//  Copyright (c) 2014 RamPerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (strong, nonatomic) UITableView *tipOptions;
@property (strong, nonatomic) IBOutlet UILabel *optionLabel;
@end
