//
//  KBUserDefaults.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBUserDefaults.h"

//NSUserDefaults KeyPaths
NSString *const kDict = @"dict";
NSString *const kGrammar = @"grammar";
NSString *const kSource = @"source";

@interface KBUserDefaults ()

@property (nonatomic, strong) NSString *defaultDictionarySource;
@property (nonatomic, strong) NSMutableDictionary *defaultGrammars;

@end


@implementation KBUserDefaults

- (instancetype)init
{
    if (self = [super init]){
        NSLog(@"init");
        _defaultGrammars = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - Dictionary Sources
- (NSString *)getDefaultDictionarySource
{
    return _defaultDictionarySource;
}

- (void)setDefaultDictionarySource:(NSString *)source
{
    _defaultDictionarySource = source;
}

#pragma mark - Grammars
- (NSDictionary *)getDefaultSearchGrammars
{
    return _defaultGrammars;
}

- (void)addDefaultSearchGrammar:(NSString *)grammar
{
    [_defaultGrammars setObject:grammar forKey:grammar];
}

- (void)removeDefaultSearchGrammar:(NSString *)grammar
{
    [_defaultGrammars removeObjectForKey:grammar];
}

@end
