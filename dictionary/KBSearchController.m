//
//  KBSearchController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSearchController.h"
#import "KBSettingsController.h"

@interface KBSearchController ()

@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation KBSearchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Dictionary";
        [self.searchButton.titleLabel setFont:[KBStyleManager helvetivaBoldWithSize:18]];
        [self.searchButton setTitleColor:[KBStyleManager whiteTextColor] forState:UIControlStateNormal];
        [self.searchButton setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [self.searchButton setBackgroundColor:[KBStyleManager greenColor]];

        [self.searchText setDelegate:self];
        [self.searchText setTintColor:[KBStyleManager grayIconColor]];
        [self.searchText setClearButtonMode:UITextFieldViewModeWhileEditing];
        [self.searchText setFont:[KBStyleManager helvetivaWithSize:16]];
        [self.searchText setTextColor:[KBStyleManager grayTextRegularColor]];
        
        UIButton *clearBtn = [self.searchText valueForKey:@"_clearButton"];
        [clearBtn setImage:[UIImage imageNamed:@"clearButton"] forState:UIControlStateNormal];
        [clearBtn setImage:[UIImage imageNamed:@"clearButtonPressed"] forState:UIControlStateHighlighted];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *book = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"book"]];
    [book setContentMode:UIViewContentModeCenter];
    
    UILabel *title = [[UILabel alloc]init];
    [title setText:@"Dictionary"];
    [title setFont:[KBStyleManager navTitleFont]];
    [title setTextColor:[KBStyleManager whiteTextColor]];
    [title sizeToFit];
    
    CGFloat padding = 8.0;
    CGSize titleSize = title.frame.size;
    CGSize bookSize = book.frame.size;
    CGFloat totalWidth = bookSize.width + padding + titleSize.width;
    CGFloat totalHeight = MAX(bookSize.height, titleSize.height);
    
    [title setFrame:CGRectMake(bookSize.width+padding, 0, titleSize.width, totalHeight)];
    [book setFrame:CGRectMake(0, 0, bookSize.width, totalHeight)];

    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, totalWidth, totalHeight)];
    [titleView addSubview:book];
    [titleView addSubview:title];
    [self.navigationItem setTitleView:titleView];
    
    self.searchButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.searchButton.layer.shadowOffset = CGSizeMake(3.0, 3.0);
    self.searchButton.layer.shadowRadius = 5.0;
    self.searchButton.layer.shadowOpacity = 0.25;
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.searchText.frame.size.height - 1, self.searchText.frame.size.width, 1.0f);
    [bottomBorder setBackgroundColor:[KBStyleManager grayIconColor].CGColor];
    [self.searchText.layer addSublayer:bottomBorder];
    
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
    [self.navigationController pushViewController:settings animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
