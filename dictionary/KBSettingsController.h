//
//  KBSettingsController.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBViewController.h"
#import "KBSettingModeCell.h"
#import "KBSettingSwitchCell.h"
#import "KBDictSourcesCell.h"

typedef NS_ENUM(NSUInteger, SettingControllerType) {
    kMainSettings,
    kResultSettings,
    kSourceSettings
};

@interface KBSettingsController : KBViewController <SettingModeCellModeChangeProtocol, SettingSwitchCellValueChangeProtocol, DictionarySourceChangeProtocol>

- (id)initWithSettingType:(SettingControllerType)type;

@end
