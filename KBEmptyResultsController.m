//
//  KBEmptyResultsController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBEmptyResultsController.h"
#import "KBNoResultsAttributedString.h"
#import "KBSettingsController.h"

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
    [self.navigationItem setRightBarButtonItem:[[KBSettingsButton alloc] initWithDisplayDelegate:self]];
    [self.message setAttributedText:[[KBNoResultsAttributedString alloc] initWithAttributedString:self.message.attributedText
                                                                                    andSearchTerm:self.searchString]];
}


- (void)presentSettingsController
{
    [self.navigationController pushViewController:[[KBSettingsController alloc] initWithSettingType:kMainSettings] animated:YES];
}
@end
