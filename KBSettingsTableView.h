//
//  KBSettingsTableView.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBSettingOptionsCell.h"
#import "KBSettingModeCell.h"

@interface KBSettingsTableView : NSObject <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithDelegate:(id<SettingModeCellModeChangeProtocol>)delegate;

@end
