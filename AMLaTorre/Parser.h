//
//  Parser.h
//  AMLaTorre
//
//  Created by Marco on 20/11/14.
//  Copyright (c) 2014 tmac12. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "List.h"

@interface Parser : NSObject <NSXMLParserDelegate> {
    AppDelegate *app;
    List *theList;
    NSMutableString *currentElementValue;
}

-(id) initParser;

@end
