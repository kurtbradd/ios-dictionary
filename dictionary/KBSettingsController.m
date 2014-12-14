//
//  KBSettingsController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingsController.h"
#import "KBSettingOptionsCell.h"
#import "KBSettingModeCell.h"
#import "KBSettingsTableView.h"
#import "KBResultsSettingTableDataSourceDelegate.h"
#import "KBDictionarySourcesTableDataDelegate.h"
#import "KBUserDefaults.h"
#import "KBAppDelegate.h"

@interface KBSettingsController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) KBSuperTableDataDelegate *tableDataSourceAndDelegate;
@property (nonatomic, strong) KBUserDefaults *settings;

@end

@implementation KBSettingsController

- (id)initWithTitle:(NSString *)title tableSourceClass:(NSString *)sourceClass
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = title;
        self.settings = [(KBAppDelegate*)[[UIApplication sharedApplication] delegate] userDefaults];
        self.tableDataSourceAndDelegate = [[NSClassFromString(sourceClass) alloc] initWithCellDelegate:self];
        self.tableView.dataSource = self.tableDataSourceAndDelegate;
        self.tableView.delegate = self.tableDataSourceAndDelegate;
    }
    return self;
}

- (id)initWithSettingType:(SettingControllerType)type
{
    switch (type) {
        case kResultSettings:
            return [self initWithTitle:@"Results" tableSourceClass:@"KBResultsSettingTableDataSourceDelegate"];
        case kSourceSettings:
            return [self initWithTitle:@"Sources" tableSourceClass:@"KBDictionarySourcesTableDataDelegate"];
        default:
            return [self initWithTitle:@"Settings" tableSourceClass:@"KBSettingsTableView"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[KBStyleManager helvetivaWithSize:14.0]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[KBStyleManager grayTextRegularColor]];
}

#pragma mark - Cell Delegate Methods
- (void)modeCellDidChangeToValue:(NSString *)value
{
//    TODO NIGHTMODE
}

- (void)switchCell:(KBSettingSwitchCell *)switchCell
  didChangeToValue:(BOOL)value
{
    SEL method = (value)?(@selector(addDefaultSearchGrammar:)):(@selector(removeDefaultSearchGrammar:));
    [self.settings performSelector:method withObject:switchCell.textLabel.text];
}

- (void)didChangeToDictionarySource:(NSString *)source
{
    [self.settings setDefaultDictionarySource:source];
}


@end
