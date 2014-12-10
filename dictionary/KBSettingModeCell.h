//
//  KBSettingModeCell.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingOptionsCell.h"

@protocol SettingModeCellModeChangeProtocol <NSObject>

@required

- (void)modeCellDidChangeToValue:(NSString *)value;

@end

@interface KBSettingModeCell : KBSettingOptionsCell

@property (nonatomic, strong) id<SettingModeCellModeChangeProtocol>delegate;

- (void)setSegmentOnAtIndex:(NSInteger)index;

@end
