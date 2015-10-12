//
//  CommonUtil.h
//
//  Created by ThanhDM on 9/30/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

@interface CommonUtil : NSObject

+(NSInteger)checkNetworkConnection; //0:OK | 1:error network
+(NSInteger)checkHost;
+(NSInteger)checkNetworkConnectionAndHost;

@end
