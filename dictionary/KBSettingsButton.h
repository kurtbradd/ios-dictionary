//
//  KBSettingsButton.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PresentSettingsCtrlProtocol <NSObject>

@required
- (void)presentSettingsController;

@end

@interface KBSettingsButton : UIBarButtonItem

- (instancetype)initWithDisplayDelegate:(id<PresentSettingsCtrlProtocol>)delegate;

@end
