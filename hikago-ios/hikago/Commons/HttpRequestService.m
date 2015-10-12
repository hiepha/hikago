//
//  HttpRequestService.m
//
//  Created by ThanhDM on 9/30/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "HttpRequestService.h"
#import "HttpRequestOperationManager.h"

@implementation HttpRequestService
+(void)postForObjectAsync:(NSString *)stringURL
                   header:(NSDictionary *)header
                parameter:(NSDictionary *)parameters
                  success:(RequestSuccessBlock)success
                  failure:(RequestFailureBlock)failure{
    //Create post request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:stringURL]];
    [request setHTTPMethod:@"POST"];
    
    //Add common header
    //    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //Add header if any
    if (header) {
        for (NSString *key in [header allKeys]) {
            [request setValue:[header objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    //Set body if any
    if(parameters){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters
                                                           options:0
                                                             error:&error];
        [request setHTTPBody:jsonData];
    }
    
    [self addRequestToQueue:request success:success failure:failure];
    
    
}

+(void)getForObjectAsync:(NSString *)stringURL
                  header:(NSDictionary *)header
               parameter:(NSDictionary *)parameters
                 success:(RequestSuccessBlock)success
                 failure:(RequestFailureBlock)failure{
    //Create get request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:stringURL]];
    [request setHTTPMethod:@"GET"];
    
    [self addRequestToQueue:request success:success failure:failure];
}

+(void)cancelAllRequest{
    HttpRequestOperationManager *manager = [HttpRequestOperationManager sharedInstance];
    [manager.operationQueue cancelAllOperations];
}

+(void)checkNetwork:(RequestFailureBlock)failure{
    //Check internet and host
    NSInteger connStatus = [CommonUtil checkNetworkConnection];
    if(connStatus != kInternetConnectionOK){
        NSString *errorMessage = nil;
        if(connStatus == kInternetConnectionErrorHost){
            errorMessage = @"Error host";
        }
        else errorMessage = @"Error internet";
        failure(-3, errorMessage);
        return;
    }
}

+(void)addRequestToQueue:(NSURLRequest *)request
                 success:(RequestSuccessBlock)success
                 failure:(RequestFailureBlock)failure{
    [self checkNetwork:failure];
    HttpRequestOperationManager *manager = [HttpRequestOperationManager sharedInstance];
    
    //Set contentype for RSS
    [manager setResponseSerializer:[AFXMLParserResponseSerializer new]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/rss+xml"];
    
    AFHTTPRequestOperation* operation = [manager HTTPRequestOperationWithRequest:request
                                                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                             if (responseObject) {
                                                                                 success(responseObject);
                                                                             }else{
                                                                                 failure(-1, @"Object response is null");
                                                                             }
                                                                         }
                                                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                             if ([operation isCancelled]) {
                                                                                 NSLog(@"REQUEST %@ is CANCELLED", request.URL);
                                                                                 return;
                                                                             }
                                                                             failure(-2, [error localizedDescription]);
                                                                         }];
    
    [manager.operationQueue addOperation:operation];
}

@end
