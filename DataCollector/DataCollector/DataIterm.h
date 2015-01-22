//
//  Discusstion.h
//  DataCollector
//
//  Created by allen on 19/12/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataIterm : NSObject

@property (strong, nonatomic) NSNumber *discusstionId;
@property (strong, nonatomic) NSString* author;
@property (strong, nonatomic) NSDate* publischDate;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* content;
@property (strong, nonatomic) UIImage* image;


@property (strong, nonatomic) NSSet* comments;

- (id)initWithAuthor:(NSString*)author publischDate:(NSDate*)publischDate content:(NSString*)content title:(NSString*)title image:(UIImage*) image;

@end
