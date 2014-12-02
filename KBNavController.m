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
        [self.navigationBar setTranslucent:NO];
        [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
        [[UINavigationBar appearance] setBarTintColor:[KBStyleManager navBlueColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[KBStyleManager navTitleFont]}];
        [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[KBStyleManager navTitleFont]}
                                                    forState:UIControlStateNormal];
        
    }
    return self;
}

@end