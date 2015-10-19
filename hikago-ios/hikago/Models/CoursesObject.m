//
//  CoursesObject.m
//  hikago
//
//  Created by ThanhDM on 10/7/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "CoursesObject.h"
#import "HttpRequestService.h"

@implementation CoursesObject

@synthesize courseId = _courseId;
@synthesize courseName = _courseName;
@synthesize createdTime = _createdTime;
@synthesize owner = _owner;
@synthesize status = _status;
@synthesize itemArray = _itemArray;

-(instancetype)init
{
    self = [super init];
    self.itemArray = [NSArray arrayWithObjects: @"courseId", @"courseName", @"createdTime", @"owner", @"status", @"stringArray", nil];
    return self;
}

- (void) getCourseList:(RequestSuccessBlock) success failure:(RequestFailureBlock) failure{
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
