//
//  User.h
//  DataCollector
//
//  Created by allen on 23/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DataIterm;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * familyName;
@property (nonatomic, retain) NSString * givenName;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSSet *iterms;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addItermsObject:(DataIterm *)value;
- (void)removeItermsObject:(DataIterm *)value;
- (void)addIterms:(NSSet *)values;
- (void)removeIterms:(NSSet *)values;

@end
