//
//  KBNoResultsAttributedString.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-03.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBNoResultsAttributedString : NSMutableAttributedString

- (instancetype)initWithAttributedString:(NSAttributedString *)string andSearchTerm:(NSString *)searchTerm;

@end
