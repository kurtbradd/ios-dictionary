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

@implementation KBUserDefaults

- (instancetype)init
{
    if (self = [super init]){
        if (![[NSUserDefaults standardUserDefaults] objectForKey:kDict]){
            [[NSUserDefaults standardUserDefaults] setObject:[[NSMutableDictionary alloc]init] forKey:kDict];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    return self;
}

#pragma mark - Dictionary Sources
- (NSString *)getDefaultDictionarySource
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kDict] objectForKey:kSource];
}

- (void)setDefaultDictionarySource:(NSString *)source
{
    [[[NSUserDefaults standardUserDefaults] objectForKey:kDict] setObject:source forKey:kSource];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Grammars
- (NSDictionary *)getDefaultSearchGrammars
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kDict] objectForKey:kGrammar];
}

- (void)addDefaultSearchGrammar:(NSString *)grammar
{
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:kDict] objectForKey:kGrammar]) {
        [[[NSUserDefaults standardUserDefaults] objectForKey:kDict] setObject:[[NSMutableDictionary alloc] init] forKey:kGrammar];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [[[[NSUserDefaults standardUserDefaults] objectForKey:kDict] objectForKey:kGrammar] setObject:@(1) forKey:grammar];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)removeDefaultSearchGrammar:(NSString *)grammar
{
    [[[[NSUserDefaults standardUserDefaults] objectForKey:kDict] objectForKey:kGrammar] removeObjectForKey:grammar];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
