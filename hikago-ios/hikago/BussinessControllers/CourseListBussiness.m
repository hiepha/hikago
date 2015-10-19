//
//  CourseListBussiness.m
//  hikago
//
//  Created by ThanhDM on 10/7/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "CourseListBussiness.h"
#import "CoursesObject.h"
#import "XMLParser.h"

@implementation CourseListBussiness

-(instancetype)init
{
    self = [super init];
    self.coursesArray = _coursesArray;
    return self;
}


- (void) getCourseList:(RequestSuccessBlock)success failure:(RequestFailureBlock)failure{

    CoursesObject *courseService = [[CoursesObject alloc] init];
    [courseService getCourseList:^(id data){
        NSLog(@"[BL] Success to get contact list");
//        XMLParser *parser = [[XMLParser alloc] init];
//        self.coursesArray = [[parser parserXMLFromData:(NSData *)data objectParse:(CoursesObject *) courseService] copy];
//        success(self.coursesArray);
        //--------------------------------------------------------------------
        // read the element data from the plist
        NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"Courses" ofType:@"plist"];
        NSArray *rawElementsArray = [[NSArray alloc] initWithContentsOfFile:thePath];
        NSLog(@"[BL] Success to get contact list");
        NSLog(@"array of course: %ld", (unsigned long)[rawElementsArray count]);
        success(rawElementsArray);
        //--------------------------------------------------------------------
    } failure:^(NSInteger errorCode, NSString *errorMsg){
        NSLog(@"Fail to get contact list from server");
        NSLog(@"Error code: %@ & %ld", errorMsg, errorCode);
        failure(errorCode, errorMsg);
    }];
    
}

@end
