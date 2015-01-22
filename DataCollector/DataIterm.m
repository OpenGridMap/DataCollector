//
//  Discusstion.m
//  DataCollector
//
//  Created by allen on 19/12/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import "DataIterm.h"

@implementation DataIterm

- (id)initWithAuthor:(NSString*)author publischDate:(NSDate*)publischDate content:(NSString*)content title:(NSString*)title image:(UIImage*) image{
    self = [super init];
    if (self) {
        _title=title;
        _author=author;
        _publischDate=publischDate;
        _content=content;
        _image=image;
    }
    return self;
}

@end
