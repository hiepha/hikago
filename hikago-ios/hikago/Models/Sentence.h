//
//  Sentence.h
//  hikago
//
//  Created by ThanhDM on 10/13/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "ObjectBase.h"

@interface Sentence : ObjectBase

@property (nonatomic, strong) NSString *sentenceId;
@property (nonatomic, strong) NSString *sentenceKey;
@property (nonatomic, strong) NSString *sentenceValue;
@property (nonatomic, strong) NSString *sentenceKeyLang;
@property (nonatomic, strong) NSString *sentenceValueLang;
@property (nonatomic, strong) NSString *courseOwner;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *favorite;

@property (nonatomic, strong) NSArray *itemArray;

- (void) getSentenceList:(RequestSuccessBlock) success failure:(RequestFailureBlock) failure;

@end
