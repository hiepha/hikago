//
//  XMLParser.m
//
//  Created by HiepLT1 on 9/30/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "XMLParser.h"

@interface XMLParser ()<NSXMLParserDelegate>{
    BOOL _accumulatingParsedCharacterData;
}

@property (nonatomic) NSObject *currentParseObject;
@property (nonatomic) NSMutableArray *currentParseBatch;
@property (nonatomic) NSMutableString *currentParsedCharacterData;
@property (nonatomic) NSObject *objectParse;
@property NSArray *arrayOject;
@property NSString *stringArray;

@end

@implementation XMLParser

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSArray *)parserXMLFromData:(NSData *)data objectParse:(NSObject *)objectParse{
    self.objectParse = objectParse;
//    for(int i=0; i < [self.arrayOject count]; i++){
//        [self.stringArray stringByAppendingString:self.arrayOject[i]];
//    }
    NSXMLParser *xmlParser = (NSXMLParser *)data;
    if(xmlParser!=nil){
        [xmlParser setDelegate:self];
        [xmlParser parse];
    }
    NSArray *arr = [_currentParseBatch copy];
    return arr;
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _currentParsedCharacterData = [[NSMutableString alloc] init];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)parser:(NSXMLParser *) parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    if([elementName isEqualToString:@"channel"]){ //Create list
        if(_currentParseBatch){
            _currentParseBatch = nil;
        }
        _currentParseBatch = [[NSMutableArray alloc]init];
    }else if([elementName isEqualToString:@"item"]){
        //Create object item
        _currentParseObject = self.objectParse;
    }else if([self.arrayOject containsObject:elementName]){
        if(_currentParsedCharacterData){
            [_currentParsedCharacterData setString:@""];
        }
        _accumulatingParsedCharacterData = YES;
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"channel"]){//End list
    }else if([elementName isEqualToString:@"item"]){//Add object item to list
        [_currentParseBatch addObject:_currentParseObject];
    }else if([self.arrayOject containsObject:elementName]){
        [_currentParseObject setValue:_currentParsedCharacterData forKey:elementName];
    }
    
    _accumulatingParsedCharacterData = NO;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (_accumulatingParsedCharacterData) {
        [_currentParsedCharacterData appendString:string];
    }
}
-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    NSString *someString = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
    
    [_currentParsedCharacterData appendString:someString];
    
//    NSString *imageURLString = [self getUrlImages:someString];
//    NSURL *imageURL = [NSURL URLWithString:imageURLString];
//    _currentParseObject.avatar = [imageURL absoluteString];

}
-(NSString *) getUrlImages:(NSString *)url{
    NSScanner *theScanner;
    NSString *imageURL = nil;
    
    theScanner = [NSScanner scannerWithString: url];
    
    // find start of tag
    [theScanner scanUpToString: @"<img" intoString: NULL];
    if ([theScanner isAtEnd] == NO) {
        
        [theScanner scanUpToString: @"src=\"" intoString: NULL];
        NSInteger newLoc2 = [theScanner scanLocation] + 5;
        [theScanner setScanLocation: newLoc2];
        
        // find end of tag
        [theScanner scanUpToString: @"\"" intoString: &imageURL];
    }
    return imageURL;
}
@end
