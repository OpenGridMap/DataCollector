//
//  Discusstion.m
//  DataCollector
//
//  Created by allen on 19/12/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import "Discusstion.h"

@implementation Discusstion

- (id)initWithAuthor:(NSString*)author publischDate:(NSDate*)publischDate content:(NSString*)content title:(NSString*)title{
    self = [super init];
    if (self) {
        _title=title;
        _author=author;
        _publischDate=publischDate;
        _content=content;
    }
    return self;
}

@end
