//
//  TipOptionsTable.h
//  TipCalculator
//
//  Created by Ram Periathiruvadi on 5/11/14.
//  Copyright (c) 2014 RamPerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipOptionsTable : NSObject <UITableViewDelegate,  UITableViewDataSource>
@property NSArray *tipOptionsArray;

- (void) saveSettings:(int)index;
@end
