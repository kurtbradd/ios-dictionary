//
//  KBNavController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBNavController.h"

@interface KBNavController ()

@end

@implementation KBNavController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSDictionary *attributes = @{NSFontAttributeName:[KBStyleManager navTitleFont],
                                          NSForegroundColorAttributeName:[KBStyleManager whiteTextColor]};
        [self.navigationBar setTranslucent:NO];
        [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
        [[UINavigationBar appearance] setBarTintColor:[KBStyleManager navBlueColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:attributes];
        [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    }
    return self;
}

@end
