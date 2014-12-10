//
//  KBSettingSwitchCell.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-08.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBSettingOptionsCell.h"

@class KBSettingSwitchCell;

@protocol SettingSwitchCellValueChangeProtocol <NSObject>

@required
- (void)switchCell:(KBSettingSwitchCell *)switchCell didChangeToValue:(BOOL)value;

@end

@interface KBSettingSwitchCell : KBSettingOptionsCell

@property (nonatomic, strong) id<SettingSwitchCellValueChangeProtocol>delegate;

- (id)initWithValue:(BOOL)value;

@end
