//
//  KBResultsSettingTableDataSourceDelegate.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-08.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBResultsSettingTableDataSourceDelegate.h"
#import "KBAppDelegate.h"

@interface KBResultsSettingTableDataSourceDelegate ()

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) id<SettingSwitchCellValueChangeProtocol> delegate;
@property (nonatomic, strong) KBUserDefaults *settings;

@end

@implementation KBResultsSettingTableDataSourceDelegate

- (instancetype)initWithCellDelegate:(id<SettingSwitchCellValueChangeProtocol>)delegate
{
    if (self = [super init]) {
        self.settings = [(KBAppDelegate*)[[UIApplication sharedApplication] delegate] userDefaults];
        self.options = @[@"Adjective", @"Adverb",@"Verb", @"Noun", @"Idiom"];
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
    return @"Choose the results that you would like returned after a search";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellTitle = self.options[indexPath.row];
    BOOL selected = ([[self.settings getDefaultSearchGrammars] objectForKey:cellTitle])?(YES):(NO);
    KBSettingSwitchCell *cell = [[KBSettingSwitchCell alloc] initWithValue:selected];
    [cell.textLabel setText:cellTitle];
    [cell setDelegate:self.delegate];
    return cell;
}

@end
