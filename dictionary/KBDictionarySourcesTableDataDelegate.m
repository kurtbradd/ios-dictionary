//
//  KBDictionarySourcesTableDataDelegate.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBDictionarySourcesTableDataDelegate.h"
#import "KBUserDefaults.h"

@interface KBDictionarySourcesTableDataDelegate ()

@property (nonatomic, strong) id<DictionarySourceChangeProtocol>delegate;
@property (nonatomic, strong) NSArray *options;
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic) NSInteger pastIndex;
@property (nonatomic, strong) KBUserDefaults *settings;

@end

@implementation KBDictionarySourcesTableDataDelegate

- (instancetype)initWithCellDelegate:(id<DictionarySourceChangeProtocol>)delegate
{
    if (self = [super init]) {
        self.settings = [[KBUserDefaults alloc] init];
        self.options = @[@"Dictionary.com", @"Merriam-Webster",@"Oxford", @"The Free Dictionary", @"Cambridge Dictionary"];
        if (![self.settings getDefaultDictionarySource]) [self.settings setDefaultDictionarySource:self.options[1]];
        self.selectedIndex = [self.options indexOfObject:[self.settings getDefaultDictionarySource]];
        self.delegate = delegate;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.options.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select a default source for word definitions.";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellAccessoryType style =
    (indexPath.row == self.selectedIndex)?(UITableViewCellAccessoryCheckmark):(UITableViewCellAccessoryNone);
    KBDictSourcesCell *cell = [[KBDictSourcesCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:@"cell"
                                                         accessoryType:style];
    [cell.textLabel setText:self.options[indexPath.row]];
    [cell setDelegate:self.delegate];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != _selectedIndex) {
        _pastIndex = _selectedIndex;
        _selectedIndex = indexPath.row;
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_pastIndex inSection:0]].accessoryType = UITableViewCellAccessoryNone;
        [self.delegate didChangeToDictionarySource:self.options[indexPath.row]];
    }
}




@end
