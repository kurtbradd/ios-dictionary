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

@interface KBSearchController ()

@property (weak, nonatomic) IBOutlet KBSearchTextField *searchText;
@property (weak, nonatomic) IBOutlet KBSearchButton *searchButton;

@end

@implementation KBSearchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Dictionary";
        [self.searchText setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitleView:[[KBDictionaryTitleView alloc] init]];        
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.view
                                                                            action:@selector(endEditing:)]];
}

- (IBAction)search:(id)sender
{
//    if (!self.searchText.text.length){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                        message:@"No Search Text :("
//                                                       delegate:nil
//                                              cancelButtonTitle:@"Ok"
//                                              otherButtonTitles:nil];
//        return [alert show];
//    }
    [self.view endEditing:YES];
    KBSettingsController *settings = [[KBSettingsController alloc] init];
    [self.navigationController pushViewController:[[KBEmptyResultsController alloc] initWithSearchString:self.searchText.text] animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
