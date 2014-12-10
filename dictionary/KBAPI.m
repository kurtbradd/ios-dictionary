//
//  KBAPI.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-04.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "KBAPI.h"
#import "KBKeys.h"

NSString *const wordnikApi = @"http://api.wordnik.com:80/v4/word.json";
NSString *const wordnikDefinitionEndpoint = @"definitions";

@interface KBAPI ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation KBAPI

@synthesize operationQueue = _operationQueue;

- (instancetype)init
{
    return [super init];
}


- (NSOperationQueue *)operationQueue
{
    if (!_operationQueue) {
        _operationQueue = [[NSOperationQueue alloc] init];
    }
    return _operationQueue;
}

- (void)searchForWord:(NSString *)word
withCompletionHandler:(void(^)(id response, NSError *error))handler
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", wordnikApi, word, wordnikDefinitionEndpoint];
    AFHTTPRequestOperation *op =
    [self GETOperationWithURLString:url
                         parameters:[self baseQueryParams]
                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                if (handler) handler(responseObject, nil);
                            }
                            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                if (handler) handler(nil, error);
                            }];
    [self.operationQueue addOperation:op];
}

- (AFHTTPRequestOperation *)GETOperationWithURLString:(NSString *)urlString
                                           parameters:(NSDictionary *)parameters
                                              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest *request =[[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    return operation;
}

- (NSMutableDictionary *)baseQueryParams
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"200" forKey:@"limit"];
    [params setValue:@"false" forKey:@"includeRelated"];
    [params setValue:@"wiktionary" forKey:@"sourceDictionaries"];
    [params setValue:@"true" forKey:@"useCanonical"];
    [params setValue:@"false" forKey:@"includeTags"];
    [params setValue:kWordnik forKey:@"api_key"];
    return params;
}
@end
















