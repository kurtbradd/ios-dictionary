//
//  KBSettingsButton.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBSettingsButton.h"

@implementation KBSettingsButton

- (instancetype)initWithDisplayDelegate:(id<PresentSettingsCtrlProtocol>)delegate
{
    return [super initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStylePlain target:delegate action:@selector(presentSettingsController)];
}

@end
