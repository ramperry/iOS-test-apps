//
//  TipOptionsTable.m
//  TipCalculator
//
//  Created by Ram Periathiruvadi on 5/11/14.
//  Copyright (c) 2014 RamPerry. All rights reserved.
//

#import "TipOptionsTable.h"

//NSArray *tipOptionsArray = nil;

@implementation TipOptionsTable


// Data Source Required methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    NSLog(@"Sections 1");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"Rows: %d",[[self tipOptionsArray] count]);
    return [[self tipOptionsArray] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [[NSString alloc] initWithFormat:@"%@", [ self.tipOptionsArray objectAtIndex:indexPath.row] ];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set the data for this cell:
    
    NSNumber *number = (NSNumber *)([[self tipOptionsArray] objectAtIndex:indexPath.row] );
    NSLog(@"Tip : %.2f", [number floatValue]);
    NSString *labelText = [[NSString alloc] initWithFormat:@"%d percent", (int) ([number floatValue] * 100)];
    cell.textLabel.text = labelText;
    
    // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryNone;
    
    cell.contentView.backgroundColor = [UIColor darkGrayColor];
    
    return cell;
}

// Delegate Method to handle selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;
    [self saveSettings:selectedRow];
}

- (void) saveSettings:(int)index {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:index forKey:@"selectedTipIndex"];
    [defaults synchronize];
}


- (id) init {
    self = [super init];
    if(self){
        [self setTipOptionsArray:@[@(0.1), @(0.15), @(0.2)] ];
    }
    return self;
}

@end
