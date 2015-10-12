//
//  XMLParser.h
//
//  Created by ThanhDM on 9/30/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject 

-(NSArray *)parserXMLFromData:(NSData *)data objectParse:(NSObject *)objectParse;

@end
