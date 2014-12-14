//
//  KBResultsController.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBViewController.h"

@interface KBResultsController : KBViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, PresentSettingsCtrlProtocol>

- (instancetype)initSearchWord:(NSString *)word withResults:(NSDictionary *)results;

@end
