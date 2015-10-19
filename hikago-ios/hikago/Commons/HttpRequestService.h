//
//  HttpRequestService.h
//
//  Created by ThanhDM on 9/30/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccessBlock)(NSArray *array);
typedef void(^RequestFailureBlock)(NSInteger errorCode, NSString *errorMsg);

@interface HttpRequestService : NSObject

+(void)postForObjectAsync:(NSString *)stringURL
                   header:(NSDictionary *)header
                parameter:(NSDictionary *)parameters
                  success:(RequestSuccessBlock)success
                  failure:(RequestFailureBlock)failure;

+(void)getForObjectAsync:(NSString *)stringURL
                  header:(NSDictionary *)header
               parameter:(NSDictionary *)parameters
                 success:(RequestSuccessBlock)success
                 failure:(RequestFailureBlock)failure;

+(void)cancelAllRequest;

@end
