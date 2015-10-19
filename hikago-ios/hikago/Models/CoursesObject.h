//
//  CoursesObject.h
//  hikago
//
//  Created by ThanhDM on 10/7/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoursesObject : NSObject

@property (nonatomic, strong) NSString *courseId;
@property (nonatomic, strong) NSString *courseName;
@property (nonatomic, strong) NSString *createdTime;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) NSArray *itemArray;

- (void) getCourseList:(RequestSuccessBlock) success failure:(RequestFailureBlock) failure;

@end
