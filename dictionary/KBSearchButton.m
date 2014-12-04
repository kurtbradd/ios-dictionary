//
//  KBSearchButton.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSearchButton.h"

@implementation KBSearchButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self.titleLabel setFont:[KBStyleManager helvetivaBoldWithSize:18]];
    [self setTitleColor:[KBStyleManager whiteTextColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    [self setBackgroundColor:[KBStyleManager greenColor]];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOffset:CGSizeMake(3.0, 3.0)];
    [self.layer setShadowRadius:5.0];
    [self.layer setShadowOpacity:0.25];
}

@end
