//
//  KBDefinitionTableCell.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-13.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBDefinitionTableCell.h"

@interface KBDefinitionTableCell ()

@property (nonatomic, strong) IBOutlet UILabel *definition;

@end

@implementation KBDefinitionTableCell


- (id)initWithDefinitionText:(NSString *)text
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 0)];
        [label setTextColor:[KBStyleManager grayTextDarkColor]];
        [label setFont:[KBStyleManager helvetivaWithSize:15.0]];
        [label setText:text];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setNumberOfLines:0];
        [label sizeToFit];
        self.frame = CGRectMake(0, 0, 220, label.frame.size.height);
        [self addSubview:label];
    }
    return self;
}

@end
