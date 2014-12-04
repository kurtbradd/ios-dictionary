//
//  KBNoResultsAttributedString.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBNoResultsAttributedString.h"

@interface KBNoResultsAttributedString ()

@end

@implementation KBNoResultsAttributedString

- (instancetype)initWithAttributedString:(NSAttributedString *)string andSearchTerm:(NSString *)searchTerm
{
    if (self = (KBNoResultsAttributedString*)[[NSMutableAttributedString alloc] initWithAttributedString:string]) {
        CGFloat fontSize = 16.0;
        [self addAttribute:NSFontAttributeName value:[KBStyleManager helvetivaWithSize:fontSize] range:(NSRange){0, self.length}];
        [self appendAttributedString:[[NSAttributedString alloc] initWithString:searchTerm
                                                                      attributes:@{NSFontAttributeName:[KBStyleManager helvetivaBoldWithSize:fontSize]}]];
        [self appendAttributedString:[[NSAttributedString alloc]initWithString:@" :("
                                                                     attributes:@{NSFontAttributeName:[KBStyleManager helvetivaWithSize:fontSize]}]];
        [self addAttribute:NSForegroundColorAttributeName value:[KBStyleManager grayTextDarkColor] range:(NSRange){0, self.length}];
    }
    return self;
}

@end
