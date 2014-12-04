//
//  KBSearchTextField.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSearchTextField.h"

@implementation KBSearchTextField

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) [self commonInit];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) [self commonInit];
    return self;
}

- (void)commonInit
{
    [self setTintColor:[KBStyleManager grayIconColor]];
    [self setClearButtonMode:UITextFieldViewModeWhileEditing];
    [self setFont:[KBStyleManager helvetivaWithSize:16]];
    [self setTextColor:[KBStyleManager grayTextRegularColor]];
    
    UIButton *clearBtn = [self valueForKey:@"_clearButton"];
    [clearBtn setImage:[UIImage imageNamed:@"clearButton"] forState:UIControlStateNormal];
    [clearBtn setImage:[UIImage imageNamed:@"clearButtonPressed"] forState:UIControlStateHighlighted];
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.frame.size.height - 1, self.frame.size.width, 1.0f);
    [bottomBorder setBackgroundColor:[KBStyleManager grayIconColor].CGColor];
    [self.layer addSublayer:bottomBorder];
}


@end
