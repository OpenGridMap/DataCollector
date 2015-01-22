//
//  MappingProvider.h
//  DataCollector
//
//  Created by allen on 22/01/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

/** This class is responsible for the mapping of the downloaded objects from the server and the objects stored at the device via CoreData.
 */
@interface MappingProvider : NSObject




/** Returns a RKMapping Object of the mapped JSON Objects and CoreData Objects.
 @return RKMapping for the stations which were mapped.
 */
+ (RKMapping *)stationMapping;

/** Returns a RKMapping Object of the mapped JSON Objects and CoreData Objects.
 @return RKMapping for the pedelecs which were mapped.
 */
+ (RKMapping *)pedelecMapping;

/** Returns a RKMapping Object of the mapped JSON Objects and CoreData Objects.
 @return RKMapping for the reservation which was mapped.
 */
+ (RKMapping *)reservationMapping;

+ (RKMapping *)reservationRequestMapping;

/** Returns a RKMapping Object of the mapped JSON Objects and CoreData Objects.
 @return RKMapping for the employee which was mapped.
 */
+ (RKMapping *)employeeMapping;

/** Returns a RKMapping Object of the mapped JSON Objects and CoreData Objects.
 @return RKMapping for the damage report which was mapped.
 */
+ (RKMapping *)damageReportMapping;
+ (RKMapping *)damageReportRequestMapping;

+ (RKMapping *)damageEntryMapping;
+ (RKMapping *)damageEntryRequestMapping;


@end

