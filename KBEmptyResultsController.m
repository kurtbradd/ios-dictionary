//
//  KBEmptyResultsController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBEmptyResultsController.h"

@interface KBEmptyResultsController ()

@property (nonatomic, weak) IBOutlet UILabel *message;
@property (nonatomic, strong) NSString *searchString;

@end

@implementation KBEmptyResultsController

- (id)initWithSearchString:(NSString *)searchString
{
    if (self = [super init]) {
        _searchString = searchString;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    CGFloat fontSize = 16.0;
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithAttributedString:self.message.attributedText];
    [label addAttribute:NSFontAttributeName value:[KBStyleManager helvetivaWithSize:fontSize] range:(NSRange){0, label.length}];
    [label appendAttributedString:[[NSAttributedString alloc] initWithString:_searchString
                                                                  attributes:@{NSFontAttributeName:[KBStyleManager helvetivaBoldWithSize:fontSize]}]];
    [label appendAttributedString:[[NSAttributedString alloc]initWithString:@" :("
                                                                 attributes:@{NSFontAttributeName:[KBStyleManager helvetivaWithSize:fontSize]}]];
    [label addAttribute:NSForegroundColorAttributeName value:[KBStyleManager grayTextDarkColor] range:(NSRange){0, label.length}];
    [self.message setAttributedText:label];
}

@end
