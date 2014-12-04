//
//  KBEmptyResultsController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBEmptyResultsController.h"
#import "KBNoResultsAttributedString.h"

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
    [self.message setAttributedText:[[KBNoResultsAttributedString alloc] initWithAttributedString:self.message.attributedText
                                                                                    andSearchTerm:self.searchString]];
}

@end
