//
//  KBAPI.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-04.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBAPI : NSObject

- (void)searchForWord:(NSString *)word
withCompletionHandler:(void(^)(id response, NSError *error))handler;

@end
