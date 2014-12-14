//
//  KBAppDelegate.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-02.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBUserDefaults.h"

@interface KBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) KBUserDefaults *userDefaults;

@end
