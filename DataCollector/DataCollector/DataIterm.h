//
//  DataIterm.h
//  DataCollector
//
//  Created by allen on 24/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Collection, MetaData, User;

@interface DataIterm : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * dataPath;
@property (nonatomic, retain) NSString * dataPathThumbnail;
@property (nonatomic, retain) NSString * dataPathWeb;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * fileName;
@property (nonatomic, retain) NSString * itermId;
@property (nonatomic, retain) User *createdBy;
@property (nonatomic, retain) MetaData *metadata;
@property (nonatomic, retain) Collection *whichCollection;

@end
