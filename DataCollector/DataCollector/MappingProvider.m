//
//  MappingProvider.m
//  DataCollector
//
//  Created by allen on 22/01/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import "MappingProvider.h"
#import "User.h"
#import "DataIterm.h"
//#import "DataModel.h"

@implementation MappingProvider


//+ (RKMapping *)itermMapping {
//    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Pedelec"
//                                                   inManagedObjectStore:[[DataModel sharedDataModel] objectStore]];
//    
//    //[mapping addAttributeMappingsFromArray:@[@"name", @"ibu", @"abv"]];
//    mapping.identificationAttributes = @[@"bikeID"];
//    
//    [mapping addAttributeMappingsFromDictionary:@{
//                                                  @"chargingLevel": @"currentCharge",
//                                                  @"chargingStatus": @"batteryIsCharging",
//                                                  @"name" : @"name",
//                                                  @"pin" : @"pin",
//                                                  @"pedelecID": @"bikeID",
//                                                  @"isFunctional": @"isUsable",
//                                                  @"stationId" : @"stationID",
//                                                  @"reserved": @"isReserved",
//                                                  @"reservedByEmployeeWithId":@"reservedByEmployeeId",
//                                                  }];
//    return mapping;
//}
//
//
//
//+ (RKMapping *) userMapping {
//    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Employee"
//                                                   inManagedObjectStore:[[DataModel sharedDataModel] objectStore]];
//    
//    //[mapping addAttributeMappingsFromArray:@[@"name", @"ibu", @"abv"]];
//    [mapping addAttributeMappingsFromDictionary:@{
//                                                  @"employeeId": @"userID",
//                                                  @"name": @"firstName",
//                                                  @"surname" : @"lastName",
//                                                  @"mobileNo" : @"phoneNumber",
//                                                  }];
//    return mapping;
//}

//+ (NSMutableDictionary *) damageReportDictionary {
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
//                                                                                  //json name: object arrtubutes
//                                                                                  @"damageReportID" : @"reportID",
//                                                                                  @"employeeID": @"employeeUserID",
//                                                                                  @"pedelecID": @"bikeID",
//                                                                                  //@"damageEntries": @"damageEntries"
//                                                                                  }];
//    return dict;
//}
//
//+ (NSMutableDictionary *) damageEntryDictionary {
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
//                                                                                  @"damageDate" : @"date",
//                                                                                  @"latitude": @"latitude",
//                                                                                  @"longitude": @"longitude",
//                                                                                  @"part": @"part",
//                                                                                  @"subpart": @"subpart"
//                                                                                  ,@"damageReportId":@"reportID"
//                                                                                  ,@"dataPath":@"dataPath"
//                                                                                  ,@"entryType":@"entryType"
//                                                                                  ,@"damageEntryId":@"damageEntryId"
//                                                                                  
//                                                                                  
//                                                                                  }];
//    return dict;
//}

//+ (RKObjectMapping *)damageReportMapping {
//    RKEntityMapping *damageReportMapping = [RKEntityMapping mappingForEntityForName:@"DamageReport" inManagedObjectStore:[[DataModel sharedDataModel] objectStore]];
//    damageReportMapping.identificationAttributes = @[@"reportID"];
//    
//    
//    NSMutableDictionary *dict = [self damageReportDictionary];
//    
//    [damageReportMapping addAttributeMappingsFromDictionary: dict];
//    
//    return damageReportMapping;
//}
//
//+ (RKMapping *)damageReportRequestMapping {
//    RKObjectMapping *damageReportMapping = [RKObjectMapping requestMapping];
//    
//    NSMutableDictionary *dict = [self damageReportDictionary];
//    
//    [damageReportMapping addAttributeMappingsFromDictionary: dict];
//    
//    return [damageReportMapping inverseMapping];
//}



//+ (RKMapping *)damageEntryMapping {
//    RKEntityMapping *damageEntryMapping = [RKEntityMapping mappingForEntityForName:@"DamageEntry" inManagedObjectStore:[[DataModel sharedDataModel] objectStore]];
//    damageEntryMapping.identificationAttributes = @[@"damageEntryId"];
//    
//    NSMutableDictionary *dict = [self damageEntryDictionary];
//    
//    [damageEntryMapping addAttributeMappingsFromDictionary: dict];
//    
//    return damageEntryMapping;
//}
//
//+ (RKMapping *)damageEntryRequestMapping {
//    RKObjectMapping *damageEntryRequestMapping = [RKObjectMapping requestMapping];
//    
//    NSMutableDictionary *dict = [self damageEntryDictionary];
//    
//    [damageEntryRequestMapping addAttributeMappingsFromDictionary: dict];
//    
//    return [damageEntryRequestMapping inverseMapping];
//}




@end
