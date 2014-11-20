//
//  Parser.m
//  AMLaTorre
//
//  Created by Marco on 20/11/14.
//  Copyright (c) 2014 tmac12. All rights reserved.
//

#import "Parser.h"

@implementation Parser

-(id) initParser
{
    if (self == [super init]) {
        app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    }
    return self;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    if ([elementName isEqualToString:@"amlatorre"]) {
        app.listArray = [[NSMutableArray alloc]init];
    }
    else if ([elementName isEqualToString:@"evento"])
    {
        theList = [[List alloc]init];
        //theList.avversario = [attributeDict objectForKey:@"avversario"];
        
    }
    
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:trimmedString];
    }
    else
    {
        //[currentElementValue appendString:string];
        [currentElementValue appendString:trimmedString];
    }
    
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"amlatorre"]) {
        return;
    }
    
    if ([elementName isEqualToString:@"evento"]) {
        [app.listArray addObject:theList];
        theList = nil;
    }
    else
    {
        [theList setValue:currentElementValue forKey:elementName];
    }
    currentElementValue = nil;
    
}

@end
