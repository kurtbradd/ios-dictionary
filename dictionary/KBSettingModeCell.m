//
//  KBSettingModeCell.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingModeCell.h"

@interface KBSettingModeCell ()

@property (nonatomic, strong) UISegmentedControl *segmentControl;

@end

@implementation KBSettingModeCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"On",@"Off",@"Auto"]];
        [self.segmentControl setTintColor:[KBStyleManager grayTextDarkColor]];
        [self setAccessoryView:self.segmentControl];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

@end
