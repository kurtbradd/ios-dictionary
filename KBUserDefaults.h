//
//  KBUserDefaults.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBUserDefaults : NSObject

#pragma mark - Dictionary Sources
- (NSString *)getDefaultDictionarySource;
- (void)setDefaultDictionarySource:(NSString *)source;

#pragma mark - Grammars
- (NSDictionary *)getDefaultSearchGrammars;
- (void)addDefaultSearchGrammar:(NSString *)grammar;
- (void)removeDefaultSearchGrammar:(NSString *)grammar;

@end
