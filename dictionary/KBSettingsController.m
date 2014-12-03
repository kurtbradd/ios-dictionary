//
//  KBSettingsController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingsController.h"
#import "KBSettingOptionsCell.h"

@interface KBSettingsController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *options;
@end

@implementation KBSettingsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
        self.options = @[@{@"title":@"Customization",@"options":@[@"Results",@"Sources"]},@{@"title":@"Modes",@"options":@[@"Night"]}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[KBStyleManager helvetivaWithSize:14.0]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[KBStyleManager grayTextRegularColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    // customization cells
    if (indexPath.section == 0) {
        KBSettingOptionsCell *cell = [[KBSettingOptionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell.textLabel setText:[self.options[indexPath.section] valueForKey:@"title"]];
        return cell;
    }
    
    // mode cells
    if (indexPath.section == 1) {
        KBSettingOptionsCell *cell = [[KBSettingOptionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell.textLabel setText:[self.options[indexPath.section] valueForKey:@"title"]];
        return cell;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

@end
