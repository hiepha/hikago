//
//  Sentence.m
//  hikago
//
//  Created by ThanhDM on 10/13/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "Sentence.h"

@implementation Sentence

@synthesize sentenceId = _sentenceId;
@synthesize sentenceKey = _sentenceKey;
@synthesize sentenceValue = _sentenceValue;
@synthesize sentenceKeyLang = _sentenceKeyLang;
@synthesize sentenceValueLang = _sentenceValueLang;
@synthesize courseOwner = _courseOwner;
@synthesize status = _status;
@synthesize favorite = _favorite;

@synthesize itemArray = _itemArray;

-(instancetype)init
{
    self = [super init];
    self.itemArray = [NSArray arrayWithObjects: @"courseId", @"courseName", @"createdTime", @"owner", @"status", @"stringArray", nil];
    return self;
}

- (void) getSentenceList:(RequestSuccessBlock) success failure:(RequestFailureBlock) failure{
    NSLog(@"courseListURLApi: %@", courseListURLApi);
    success(nil);
    //    [HttpRequestService getForObjectAsync:courseListURLApi
    //                                   header:nil
    //                                parameter:nil
    //                                  success:^(id data) {
    //                                      success(data);
    //                                  }
    //                                  failure:failure];
}

@end
