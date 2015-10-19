//
//  HttpRequestOperationManager.h
//
//  Created by ThanhDM on 9/30/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface HttpRequestOperationManager : AFHTTPRequestOperationManager

+(HttpRequestOperationManager *) sharedInstance;

@end
