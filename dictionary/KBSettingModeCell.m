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
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"On",@"Off",@"Auto"]];
        [_segmentControl setTintColor:[KBStyleManager grayTextDarkColor]];
        [_segmentControl addTarget:self
                            action:@selector(segmentSelected)
                  forControlEvents:UIControlEventValueChanged];
        [self setAccessoryView:_segmentControl];
    }
    return self;
}

- (void)setSegmentOnAtIndex:(NSInteger)index;
{
    [self.segmentControl setSelectedSegmentIndex:index];
}

- (void)segmentSelected
{
    if (self.delegate) {
        NSString *selectedValue =[_segmentControl titleForSegmentAtIndex:_segmentControl.selectedSegmentIndex];
        [self.delegate modeCellDidChangeToValue:selectedValue];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

@end
