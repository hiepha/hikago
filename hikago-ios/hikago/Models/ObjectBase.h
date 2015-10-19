//
//  ObjectBase.h
//  hikago
//
//  Created by ThanhDM on 10/7/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

@interface ObjectBase : NSObject

    typedef void(^RequestSuccessBlock)(NSArray *arrayCourse);
    typedef void(^RequestFailureBlock)(NSInteger errorCode, NSString *errorMsg);

@end
