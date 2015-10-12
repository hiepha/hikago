//
//  CourseListBussiness.h
//  hikago
//
//  Created by ThanhDM on 10/7/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseListBussiness : NSObject

@property (nonatomic, strong) NSMutableArray *coursesArray;
- (void) getCourseList:(RequestSuccessBlock) success failure:(RequestFailureBlock) failure;

@end
