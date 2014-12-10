//
//  KBDictionarySourcesTableDataDelegate.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBDictSourcesCell.h"

@interface KBDictionarySourcesTableDataDelegate : KBSuperTableDataDelegate

- (instancetype)initWithCellDelegate:(id<DictionarySourceChangeProtocol>)delegate;

@end

