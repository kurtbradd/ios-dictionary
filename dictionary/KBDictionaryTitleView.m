//
//  KBDictionaryTitleView.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBDictionaryTitleView.h"

@implementation KBDictionaryTitleView

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
    UIImageView *book = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"book"]];
    [book setContentMode:UIViewContentModeCenter];
    
    UILabel *title = [[UILabel alloc]init];
    [title setText:@"Dictionary"];
    [title setFont:[KBStyleManager navTitleFont]];
    [title setTextColor:[KBStyleManager whiteTextColor]];
    [title sizeToFit];
    
    CGFloat padding = 8.0;
    CGSize titleSize = title.frame.size;
    CGSize bookSize = book.frame.size;
    CGFloat totalWidth = bookSize.width + padding + titleSize.width;
    CGFloat totalHeight = MAX(bookSize.height, titleSize.height);
    
    [title setFrame:CGRectMake(bookSize.width+padding, 0, titleSize.width, totalHeight)];
    [book setFrame:CGRectMake(0, 0, bookSize.width, totalHeight)];
    
    [self setFrame:CGRectMake(0, 0, totalWidth, totalHeight)];
    [self addSubview:book];
    [self addSubview:title];

}

@end
