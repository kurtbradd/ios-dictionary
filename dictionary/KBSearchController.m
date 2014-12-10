//
//  KBSearchController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSearchController.h"
#import "KBSettingsController.h"
#import "KBSearchButton.h"
#import "KBDictionaryTitleView.h"
#import "KBSearchTextField.h"
#import "KBEmptyResultsController.h"
#import "KBAPI.h"
#import "MBProgressHUD.h"
#import "KBResultsController.h"

@interface KBSearchController ()

@property (weak, nonatomic) IBOutlet KBSearchTextField *searchText;
@property (weak, nonatomic) IBOutlet KBSearchButton *searchButton;
@property (nonatomic, strong) KBAPI *api;

@end

@implementation KBSearchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Dictionary";
        [self setApi:[[KBAPI alloc]init]];
        [self.searchText setDelegate:self];
    }
    return self;
}

- (void)presentSettingsController
{
    [self.view endEditing:YES];
    [self.navigationController pushViewController:[[KBSettingsController alloc] initWithSettingType:kMainSettings] animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitleView:[[KBDictionaryTitleView alloc] init]];
    [self.navigationItem setRightBarButtonItem:[[KBSettingsButton alloc] initWithDisplayDelegate:self]];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.view
                                                                            action:@selector(endEditing:)]];
}

- (IBAction)search:(id)sender
{
//    if (!self.searchText.text.length){
//        return [self displayErrorWithMessage:@"No Search Text :("];
//    }    
    [self.view endEditing:YES];
    NSString *searchWord = @"project";
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    [self.api searchForWord:searchWord withCompletionHandler:^(id response, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (error) return [self displayErrorWithMessage:@"Oops, something went wrong :/"];
        
        // Parse Response
        for (id definition in response) {
            if (![results objectForKey:definition[@"partOfSpeech"]]) {
                [results setObject:[[NSMutableArray alloc]init] forKey:definition[@"partOfSpeech"]];
            }
            [[results objectForKey:definition[@"partOfSpeech"]] addObject:definition[@"text"]];
        }
        
        if (results.count > 0) {
            return [self.navigationController pushViewController:[[KBResultsController alloc] initSearchWord:searchWord withResults:results] animated:YES];
        }
        [self.navigationController pushViewController:[[KBEmptyResultsController alloc] initWithSearchString:searchWord] animated:YES];
    }];
}

- (void)displayErrorWithMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    return [alert show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
