//
//  KBCardViewCell.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBCardViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface KBCardViewCell ()
//@property (strong, nonatomic) IBOutlet UIView *innerCard;
//@property (strong, nonatomic) IBOutlet UILabel *wordType;

@end

@implementation KBCardViewCell

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self baseSetup];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"KBCardViewCell" owner:self options:nil];
        self = [arrayOfViews objectAtIndex:0];
        [self baseSetup];
    }
    return self;
}

- (void)baseSetup
{
    [self setBackgroundColor:[UIColor clearColor]];
    [self.innerCard setBackgroundColor:[KBStyleManager whiteTextColor]];
    [self.innerCard.layer setBorderColor:[KBStyleManager grayIconColor].CGColor];
    [self.innerCard.layer setBorderWidth:1.4f];
    [self.innerCard.layer setCornerRadius:16.0f];
    
    [self.wordType setText:@"Noun"];
    [self.wordType setTextColor:[KBStyleManager grayTextDarkColor]];
    [self.wordType setFont:[KBStyleManager helvetivaBoldWithSize:24.0]];
    
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.wordType.frame.size.height - 1, self.wordType.frame.size.width, 1.0f);
    [bottomBorder setBackgroundColor:[KBStyleManager grayIconColor].CGColor];
    [self.wordType.layer addSublayer:bottomBorder];
}

@end
