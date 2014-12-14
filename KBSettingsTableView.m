//
//  KBSettingsTableView.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingsTableView.h"
#import "KBSettingsController.h"
#import "KBResultsSettingTableDataSourceDelegate.h"
#import "KBDictionarySourcesTableDataDelegate.h"

@interface KBSettingsTableView ()

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) id<SettingModeCellModeChangeProtocol> delegate;

@end

@implementation KBSettingsTableView

- (instancetype)initWithCellDelegate:(id<SettingModeCellModeChangeProtocol>)delegate;
{
    if (self = [super init]) {
        self.delegate = delegate;
        self.options = @[@{@"title":@"Customization",@"options":@[@"Results",@"Sources"]},@{@"title":@"Modes",@"options":@[@"Night"]}];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray*)[self.options[section] valueForKey:@"options"]count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.options.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.options[section] valueForKey:@"title"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *class = (indexPath.section == 0)?(@"KBSettingOptionsCell"):(@"KBSettingModeCell");
    UITableViewCell *cell = [[NSClassFromString(class) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell.textLabel setText:[[self.options[indexPath.section] valueForKey:@"options"] objectAtIndex:indexPath.row]];
    if (indexPath.section == 1) {
        [(KBSettingModeCell*)cell setSegmentOnAtIndex:1]; //default to night-mode off
        [(KBSettingModeCell*)cell setDelegate:self.delegate];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    if (indexPath.section == 0) {
        SettingControllerType type = (indexPath.row == 0)?(kResultSettings):(kSourceSettings);
        KBSettingsController *ctrl = [[KBSettingsController alloc] initWithSettingType:type];
        [[(UIViewController *)self.delegate navigationController] pushViewController:ctrl animated:YES];
    }
}

@end
