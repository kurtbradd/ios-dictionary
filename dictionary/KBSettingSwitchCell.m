//
//  KBSettingSwitchCell.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-08.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingSwitchCell.h"

@interface KBSettingSwitchCell ()

@property (nonatomic, strong) UISwitch *modeSwitch;

@end

@implementation KBSettingSwitchCell

- (id)initWithValue:(BOOL)value
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]) {
        self.modeSwitch = [[UISwitch alloc] init];
        [self.modeSwitch setOn:value];
        [self.modeSwitch addTarget:self
                            action:@selector(modeSwitchChanged:)
                  forControlEvents:UIControlEventValueChanged];
        [self setAccessoryView:self.modeSwitch];
    }
    return  self;
}

- (void)modeSwitchChanged:(UISwitch *)modeSwitch
{
    if (self.delegate) [self.delegate switchCell:self didChangeToValue:modeSwitch.on];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

@end
