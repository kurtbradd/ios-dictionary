//
//  KBResultsSettingTableDataSourceDelegate.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-08.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBSettingSwitchCell.h"

@interface KBResultsSettingTableDataSourceDelegate : KBSuperTableDataDelegate

- (instancetype)initWithCellDelegate:(id<SettingSwitchCellValueChangeProtocol>)delegate;

@end
