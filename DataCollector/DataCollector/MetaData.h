//
//  MetaData.h
//  DataCollector
//
//  Created by allen on 24/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DataIterm;

@interface MetaData : NSManagedObject

@property (nonatomic, retain) NSNumber * accuracy;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * deviceID;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * metadataId;
@property (nonatomic, retain) NSMutableArray * tags;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) DataIterm *whichIterm;

@end
