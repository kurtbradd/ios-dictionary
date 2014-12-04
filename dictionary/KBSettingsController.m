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

@interface KBSettingsController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) KBSettingsTableView *tableDataSourceAndDelegate;
@end

@implementation KBSettingsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
        self.tableDataSourceAndDelegate = [[KBSettingsTableView alloc] initWithDelegate:self];
        self.tableView.dataSource = self.tableDataSourceAndDelegate;
        self.tableView.delegate = self.tableDataSourceAndDelegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[KBStyleManager helvetivaWithSize:14.0]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[KBStyleManager grayTextRegularColor]];
}

#pragma mark - SettingModeCellModeChangeProtocol

- (void)modeCellDidChangeToValue:(NSString *)value
{
//    handle mode change
}

@end
