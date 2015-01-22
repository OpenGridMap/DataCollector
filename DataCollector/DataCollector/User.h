//
//  User.h
//  DataCollector
//
//  Created by allen on 16/12/14.
//  Copyright (c) 2014 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * email;

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * blog;
@property (nonatomic, retain) NSString * introduction;
@property (nonatomic, retain) NSData   * profileImageData;

//- (id)initWithEmail:(NSString *)email phoneNumber:(NSString *)phoneNumber;


@end
