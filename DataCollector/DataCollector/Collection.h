//
//  Collection.h
//  DataCollector
//
//  Created by allen on 24/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DataIterm, User;

@interface Collection : NSManagedObject

@property (nonatomic, retain) NSString * collectionId;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) User *createdBy;
@property (nonatomic, retain) NSMutableArray *iterms;
@end

@interface Collection (CoreDataGeneratedAccessors)

- (void)addItermsObject:(DataIterm *)value;
- (void)removeItermsObject:(DataIterm *)value;
- (void)addIterms:(NSSet *)values;
- (void)removeIterms:(NSSet *)values;

@end
